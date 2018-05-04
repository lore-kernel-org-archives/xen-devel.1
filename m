From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH for-4.11] x86/pv: Unconditionally hide
 EFER.SVME from PV guests
Date: Fri, 4 May 2018 14:45:40 -0400
Message-ID: <dcd3f1c1-3fcf-143a-25fb-a58d2468e318@oracle.com>
References: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDQvMjAxOCAwMToyOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L21zci1pbmRleC5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
c3ItaW5kZXguaAo+IEBAIC0zMSw2ICszMSw5IEBACj4gICNkZWZpbmUgRUZFUl9MTVNMRQkJKDE8
PF9FRkVSX0xNU0xFKQo+ICAjZGVmaW5lIEVGRVJfRkZYU0UJCSgxPDxfRUZFUl9GRlhTRSkKPiAg
Cj4gKyNkZWZpbmUgRUZFUl9LTk9XTl9NQVNLCQkoRUZFUl9TQ0UgfCBFRkVSX0xNRSB8IEVGRVJf
TE1BIHwgRUZFUl9OWCB8IFwKCgpJIHRoaW5rIHRoZXJlIGlzIGFuIGV4dHJhIHRhYiBoZXJlIChi
dXQgdGhpcyBtYXkgYmUgbXkgZW1haWwgY2xpZW50IG5vdApzaG93aW5nIGl0IHByb3Blcmx5KQoK
UmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
