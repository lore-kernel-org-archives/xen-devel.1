From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 12/16 RESEND] rbtree: add
 __rb_change_child() helper function
Date: Wed, 03 Jan 2018 04:30:50 -0700
Message-ID: <5A4CCCFA020000780019A769@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-13-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-13-kpraveen.lkml@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, dario.faggioli@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE3IGF0IDE2OjIwLCA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiBBZGQg
X19yYl9jaGFuZ2VfY2hpbGQoKSBhcyBhbiBpbmxpbmUgaGVscGVyIGZ1bmN0aW9uIHRvIHJlcGxh
Y2UgY29kZSB0aGF0Cj4gd291bGQgb3RoZXJ3aXNlIGJlIGR1cGxpY2F0ZWQgNCB0aW1lcyBpbiB0
aGUgc291cmNlLgo+IAo+IE5vIGNoYW5nZXMgdG8gYmluYXJ5IHNpemUgb3Igc3BlZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWljaGVsIExlc3BpbmFzc2UgPHdhbGtlbkBnb29nbGUuY29tPgo+IFJl
dmlld2VkLWJ5OiBSaWsgdmFuIFJpZWwgPHJpZWxAcmVkaGF0LmNvbT4KPiBDYzogUGV0ZXIgWmlq
bHN0cmEgPGEucC56aWpsc3RyYUBjaGVsbG8ubmw+Cj4gQ2M6IEFuZHJlYSBBcmNhbmdlbGkgPGFh
cmNhbmdlQHJlZGhhdC5jb20+Cj4gQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFk
Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPiBbTGludXggY29tbWl0IDdhYmM3MDRhZTM5OWZjYjljNTFjYTIwMGIw
NDU2ZjhhOTc1YTgwMTFdCj4gCj4gUG9ydGVkIHRvIFhlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
cmF2ZWVuIEt1bWFyIDxrcHJhdmVlbi5sa21sQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
