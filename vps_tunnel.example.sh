#!/bin/bash
# VPS SSH Tunnel Examples
# Copy to vps_tunnel.sh and customize for your VPS setup

# ============================================
# Bitcoin Node Tunnels
# ============================================

# BTC RPC Explorer Web UI (port 3002)
# Access: http://localhost:3002
# Usage: ./vps_tunnel.sh explorer
function tunnel_explorer() {
    echo "Forwarding BTC RPC Explorer to http://localhost:3002"
    echo "Press Ctrl+C to stop"
    ssh -N -L 3002:localhost:3002 user@vps-hostname
}

# Bitcoin RPC (port 8332) - for Trezor Suite/DATUM
# Usage: ./vps_tunnel.sh rpc
function tunnel_rpc() {
    echo "Forwarding Bitcoin RPC to localhost:8332"
    echo "Press Ctrl+C to stop"
    ssh -N -L 8332:localhost:8332 user@vps-hostname
}

# Bitcoin P2P (port 8333) - optional, for remote peer connection
# Usage: ./vps_tunnel.sh p2p
function tunnel_p2p() {
    echo "Forwarding Bitcoin P2P to localhost:8333"
    echo "Press Ctrl+C to stop"
    ssh -N -L 8333:localhost:8333 user@vps-hostname
}

# All Bitcoin tunnels at once
# Usage: ./vps_tunnel.sh bitcoin-all
function tunnel_bitcoin_all() {
    echo "Forwarding all Bitcoin ports:"
    echo "  - RPC: localhost:8332"
    echo "  - Explorer: http://localhost:3002"
    echo "Press Ctrl+C to stop"
    ssh -N \
        -L 8332:localhost:8332 \
        -L 3002:localhost:3002 \
        user@vps-hostname
}

# ============================================
# Generic Port Forward
# ============================================

# Forward any port
# Usage: ./vps_tunnel.sh port <local_port> <remote_port>
function tunnel_port() {
    local local_port=$1
    local remote_port=$2
    echo "Forwarding localhost:$local_port -> VPS:$remote_port"
    ssh -N -L "${local_port}:localhost:${remote_port}" user@vps-hostname
}

# ============================================
# Main
# ============================================

case "$1" in
    explorer)
        tunnel_explorer
        ;;
    rpc)
        tunnel_rpc
        ;;
    p2p)
        tunnel_p2p
        ;;
    bitcoin-all)
        tunnel_bitcoin_all
        ;;
    port)
        tunnel_port "$2" "$3"
        ;;
    *)
        echo "Usage: $0 {explorer|rpc|p2p|bitcoin-all|port <local> <remote>}"
        echo ""
        echo "Examples:"
        echo "  $0 explorer      - Forward BTC RPC Explorer to http://localhost:3002"
        echo "  $0 rpc           - Forward Bitcoin RPC for Trezor Suite/DATUM"
        echo "  $0 bitcoin-all   - Forward all Bitcoin-related ports"
        echo "  $0 port 8080 80  - Forward VPS port 80 to local 8080"
        exit 1
        ;;
esac
