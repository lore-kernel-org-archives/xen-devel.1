From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/pv: Unconditionally hide
 EFER.SVME from PV guests
Date: Mon, 07 May 2018 01:03:34 -0600
Message-ID: <5AEFFA4602000078001C1125@prv1-mh.provo.novell.com>
References: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA1LjE4IGF0IDE5OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jCj4gQEAgLTg2Nyw3ICs4NjcsOSBAQCBzdGF0aWMgaW50
IHJlYWRfbXNyKHVuc2lnbmVkIGludCByZWcsIHVpbnQ2NF90ICp2YWwsCj4gICAgICAgICAgcmV0
dXJuIFg4NkVNVUxfT0tBWTsKPiAgCj4gICAgICBjYXNlIE1TUl9FRkVSOgo+IC0gICAgICAgICp2
YWwgPSByZWFkX2VmZXIoKTsKPiArICAgICAgICAvKiBIaWRlIHVua25vd24gYml0cywgYW5kIHVu
Y29uZGl0aW9uYWxseSBoaWRlIFNWTUUgZnJvbSBndWVzdHMuICovCj4gKyAgICAgICAgKnZhbCA9
IHJlYWRfZWZlcigpICYgRUZFUl9LTk9XTl9NQVNLICYgfkVGRVJfU1ZNRTsKPiArICAgICAgICAv
KiBIaWRlIHRoZSA2NC1iaXQgZmVhdHVyZXMgZnJvbSAzMi1iaXQgZ3Vlc3RzLiAqLwo+ICAgICAg
ICAgIGlmICggaXNfcHZfMzJiaXRfZG9tYWluKGN1cnJkKSApCj4gICAgICAgICAgICAgICp2YWwg
Jj0gfihFRkVSX0xNRSB8IEVGRVJfTE1BIHwgRUZFUl9MTVNMRSk7CgpXb3VsZG4ndCBpdCBiZSBi
ZXR0ZXIgdGhlbiB0byBhbHNvIG1vdmUgdGhlIExNU0xFIGhpZGluZyB1cD8gQW5kIHdoYXQgYWJv
dXQKU0NFPyBQViBndWVzdHMgbm90IGJlaW5nIGFsbG93ZWQgdG8gd3JpdGUgRUZFUiwgSSB3b3Vs
ZCB0aGluayB0aGV5IHNob3VsZG4ndApzZWUgYml0cyB0aGV5IGFyZW4ndCBzdXBwb3NlZCB0byBj
YXJlIGFib3V0IGFuZCBhcmVuJ3QgYWJsZSB0byBzZXQuIElmIHdlCndlcmUgdG8gYWxsb3cgc3Vj
aCB3cml0ZXMsIEkgYXNzdW1lIGl0IHdvdWxkIG9ubHkgYmUgTlggYW5kIG1heWJlIEZGWFNFCndo
aWNoIHdlJ2QgcGVybWl0IHRoZSBndWVzdCB0byBjb250cm9sLiBPYnZpb3VzbHkgKEkgdGhpbmsp
IExNRSBhbmQgTE1BIG91Z2h0CnRvIGJlIHNlZW4gc2V0IGJ5IDY0LWJpdCBndWVzdHMuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
