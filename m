From: "Jan Beulich" <JBeulich@suse.com>
Subject: preparations for 4.11.1 and 4.8.5
Date: Mon, 08 Oct 2018 07:06:10 -0600
Message-ID: <5BBB564202000078001EF950@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9VEm-0001c0-8E
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 13:06:16 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxsLAoKYm90aCByZWxlYXNlcyBhcmUgZHVlIGluIGFib3V0IGEgbW9udGgncyB0aW1lLiBQbGVh
c2UgcG9pbnQgb3V0CmJhY2twb3J0cyB5b3UgZmluZCBtaXNzaW5nIGZyb20gdGhlaXIgcmVzcGVj
dGl2ZSBzdGFnaW5nIGJyYW5jaGVzLApidXQgd2hpY2ggeW91IGNvbnNpZGVyIHJlbGV2YW50LiBP
biB0b3Agb2Ygd2hhdCBJJ3ZlIGp1c3QgcHVzaGVkCnRoZXJlIEkgaGF2ZQoKMmZiNTdlNGJlZQl4
ODY6IHNpbGVuY2UgZmFsc2UgbG9nIG1lc3NhZ2VzIGZvciBwbGFpbiAieHB0aSIgLyAicHYtbDF0
ZiIKNTFlMGNiNDU5Mwl4ODY6IHNwbGl0IG9wdF94cHRpCjBiODk2NDNlZjYJeDg2OiBzcGxpdCBv
cHRfcHZfbDF0Zgo4NzQzZDJkZWE1CXg4NjogZml4ICJ4cHRpPSIgYW5kICJwdi1sMXRmPSIgeWV0
IGFnYWluCmUzMGM0N2NkOGIJdnRkOiBhZGQgbWlzc2luZyBjaGVjayBmb3Igc2hhcmVkIEVQVC4u
LgoKcXVldWVkIGFscmVhZHkgLSBubyBuZWVkIHRvIHBvaW50IHRoZXNlIG91dCBzZXBhcmF0ZWx5
LgoKSSd2ZSBub3RpY2VkIG9ubHkgbm93IHRoYXQgZXZlbiA0LjguNCBoYXMgZ29uZSBvdXQgYWxy
ZWFkeSBhZnRlcgppdHMgZnVsbCBzdXBwb3J0IHRpbWUgcGVyaW9kIHdhcyBvdmVyLCBkdWUgdG8g
dGhlIHNpZ25pZmljYW50IGRlbGF5CmJldHdlZW4gaXRzIHByZXBhcmF0aW9ucyBhbm5vdW5jZW1l
bnQgYW5kIGl0IGFjdHVhbGx5IGhhdmluZwpiZWNvbWUgcmVhZHkuIFNpbmNlIGl0cyB0cmVlIHdh
cyBtYWludGFpbmVkIGFzIGlmIGFub3RoZXIgc3RhYmxlCnJlbGVhc2Ugd291bGQgYmUgZG9uZSwg
SSB0aGluayB3ZSB3aWxsIHdhbnQgdG8gY3V0IHN1Y2ggYSByZWxlYXNlLgpJbiB0aGF0IGV2ZW50
LCA0LjguNSBpcyBnb2luZyB0byBiZSB0aGUgbGFzdCBYZW5Qcm9qZWN0IGNvb3JkaW5hdGVkCnJl
bGVhc2UgZnJvbSB0aGF0IGJyYW5jaC4gSWYgd2UgZGVjaWRlIG90aGVyd2lzZSwgd2UnZCB0aGVu
CmFubm91bmNlIGFmdGVyIHRoZSBmYWN0IHRoYXQgNC44LjQgYWN0dWFsbHkgd2FzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
