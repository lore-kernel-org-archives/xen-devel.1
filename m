From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11] x86/pv: Unconditionally hide
 EFER.SVME from PV guests
Date: Fri, 4 May 2018 19:48:17 +0100
Message-ID: <73898cdb-8453-8a6a-0698-44738c538833@citrix.com>
References: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
 <dcd3f1c1-3fcf-143a-25fb-a58d2468e318@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dcd3f1c1-3fcf-143a-25fb-a58d2468e318@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDUvMTggMTk6NDUsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNS8wNC8yMDE4
IDAxOjI4IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L21zci1pbmRleC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgK
Pj4gQEAgLTMxLDYgKzMxLDkgQEAKPj4gICNkZWZpbmUgRUZFUl9MTVNMRQkJKDE8PF9FRkVSX0xN
U0xFKQo+PiAgI2RlZmluZSBFRkVSX0ZGWFNFCQkoMTw8X0VGRVJfRkZYU0UpCj4+ICAKPj4gKyNk
ZWZpbmUgRUZFUl9LTk9XTl9NQVNLCQkoRUZFUl9TQ0UgfCBFRkVSX0xNRSB8IEVGRVJfTE1BIHwg
RUZFUl9OWCB8IFwKPgo+IEkgdGhpbmsgdGhlcmUgaXMgYW4gZXh0cmEgdGFiIGhlcmUgKGJ1dCB0
aGlzIG1heSBiZSBteSBlbWFpbCBjbGllbnQgbm90Cj4gc2hvd2luZyBpdCBwcm9wZXJseSkKCkl0
cyBjb3JyZWN0IGluIHRoZSBmaWxlLCBidXQgcmVuZGVycyBpbmNvcnJlY3RseSBldmVyeXdoZXJl
IGVsc2UuwqAgKEkKZGlkIGEgZG91YmxldGFrZSB0aGUgZmlyc3QgdGltZSBJIHNhdyB0aGUgZW1h
aWwuKQoKPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT4KClRoYW5rcywKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
