From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH V4] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Thu, 15 Feb 2018 16:57:45 +0000
Message-ID: <7dda9477-f998-10f6-e259-ec00d1ec49ff@citrix.com>
References: <1518174113-2567-1-git-send-email-rcojocaru@bitdefender.com>
 <5A85C87802000078001A82AC@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A85C87802000078001A82AC@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: bitweasil@cryptohaze.com, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMTggMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYveDg2LWRlZm5zLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni94ODYt
ZGVmbnMuaAo+PiBAQCAtNDMsNiArNDMsMTEgQEAKPj4gICNkZWZpbmUgWDg2X0NSMF9QRyAgICAg
ICAgICAgICAgMHg4MDAwMDAwMCAvKiBQYWdpbmcgICAgICAgICAgICAgICAgICAgKFJXKSAKPj4g
Ki8KPj4gIAo+PiAgLyoKPj4gKyAqIEludGVsIENQVSBmbGFncyBpbiBDUjMKPj4gKyAqLwo+PiAr
I2RlZmluZSBYODZfQ1IzX05PRkxVU0ggICAgMHg4MDAwMDAwMDAwMDAwMDAwCj4gUGxlYXNlIGFk
ZCB0aGUgVUxMIHN1ZmZpeCwgc28gdGhlIGluc24gZW11bGF0b3IgY291bGQgZXZlbnR1YWxseQo+
IHVzZSB0aGlzIHdpdGhvdXQgYnJlYWtpbmcgdGhlIDMyLWJpdCB0ZXN0IGhhcm5lc3MgYnVpbGQu
CgpfQUMoLi4uICwgVUxMKSBwbGVhc2UuwqAgSWYgWGVuIGRvZXMgc3RhcnQgdXNpbmcgUENJRCwg
dGhlbiB3ZSB3aWxsIG5lZWQKdGhpcyB1c2FibGUgaW4gYXNtLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
