From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] xen/PVH: Set up GS segment for stack
 canary
Date: Wed, 02 May 2018 02:16:13 -0600
Message-ID: <5AE973CD02000078001C008E__49978.4751599238$1525248902$gmane$org@prv1-mh.provo.novell.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-4-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=toke=hv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDmw4-0000VW-Gz
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 08:16:24 +0000
In-Reply-To: <20180430162339.17143-4-boris.ostrovsky@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE4IGF0IDE4OjIzLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IC0tLSBhL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKPiArKysgYi9hcmNoL3g4Ni94ZW4v
eGVuLXB2aC5TCj4gQEAgLTU0LDYgKzU0LDkgQEAKPiAgICogY2hhcmdlIG9mIHNldHRpbmcgdXAg
aXQncyBvd24gc3RhY2ssIEdEVCBhbmQgSURULgo+ICAgKi8KPiAgCj4gKyNkZWZpbmUgUFZIX0dE
VF9FTlRSWV9DQU5BUlkgICAgNAo+ICsjZGVmaW5lIFBWSF9DQU5BUllfU0VMICAgICAgICAgIChQ
VkhfR0RUX0VOVFJZX0NBTkFSWSAqIDgpCgpJIGNhbiBvbmx5IGFkdmlzZSBhZ2FpbnN0IGRvaW5n
IGl0IHRoaXMgd2F5OiBUaGVyZSdzIG5vIHNhZmVndWFyZCBhZ2FpbnN0CnNvbWVvbmUgY2hhbmdp
bmcgYXNtL3NlZ21lbnQuaCB3aXRob3V0IGNoYW5naW5nIHRoaXMgdmFsdWUgKGluIGZhY3QKdGhp
cyBhcHBsaWVzIHRvIGFsbCBvZiB0aGUgR0RUIHNlbGVjdG9ycyBwb3B1bGF0ZWQgaW4gdGhpcyBm
aWxlKS4gQXQgdGhlIHZlcnkKbGVhc3QgdGllIHRoaXMgdG8gR0RUX0VOVFJZX0JPT1RfVFNTIC8g
X19CT09UX1RTUz8KCj4gQEAgLTY0LDYgKzY3LDkgQEAgRU5UUlkocHZoX3N0YXJ0X3hlbikKPiAg
CW1vdiAlZWF4LCVlcwo+ICAJbW92ICVlYXgsJXNzCj4gIAo+ICsJbW92ICQoUFZIX0NBTkFSWV9T
RUwpLCVlYXgKPiArCW1vdiAlZWF4LCVncwo+ICsKPiAgCS8qIFN0YXNoIGh2bV9zdGFydF9pbmZv
LiAqLwo+ICAJbW92ICRfcGEocHZoX3N0YXJ0X2luZm8pLCAlZWRpCj4gIAltb3YgJWVieCwgJWVz
aQo+IEBAIC0xNTAsNiArMTU2LDcgQEAgZ2R0X3N0YXJ0Ogo+ICAJLnF1YWQgMHgwMGNmOWEwMDAw
MDBmZmZmICAgICAgICAgICAgLyogX19CT09UX0NTICovCj4gICNlbmRpZgo+ICAJLnF1YWQgMHgw
MGNmOTIwMDAwMDBmZmZmICAgICAgICAgICAgLyogX19CT09UX0RTICovCj4gKwkucXVhZCAweDAw
NDA5MDAwMDAwMDAwMTggICAgICAgICAgICAvKiBQVkhfQ0FOQVJZX1NFTCAqLwoKV2l0aG91dCBh
bnkgZnVydGhlciBjb2RlIGJlZm9yZSBsb2FkaW5nIHRoZSBzZWxlY3RvciwgdGhpcyBwb2ludHMg
YXQKcGh5c2ljYWwgYWRkcmVzcyAwLiBEb24ndCB5b3UgbmVlZCB0byBhZGQgaW4gdGhlIGJhc2Ug
YWRkcmVzcyBvZgp0aGUgcGVyLUNQVSBzdGFja19jYW5hcnk/CgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
