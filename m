From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/blkfront: correct purging of persistent
 grants
Date: Fri, 28 Sep 2018 09:33:13 -0400
Message-ID: <b454645f-de15-2912-864e-18f00736013d__2340.72442767701$1538141451$gmane$org@oracle.com>
References: <20180928072827.14229-1-jgross@suse.com>
 <95e32835-426f-36c9-a86a-09563f090f22@oracle.com>
 <772c3886-d4fe-b912-b125-a648b31a3074@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a6ty=mk=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g5ssA-0007Ph-Lj
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 13:31:58 +0000
In-Reply-To: <772c3886-d4fe-b912-b125-a648b31a3074@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8yOC8xOCA5OjEzIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDI4LzA5LzIwMTgg
MTQ6NDUsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gOS8yOC8xOCAzOjI4IEFNLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gQ29tbWl0IGE0NmI1MzY3MmIyYzJlMzc3MGIzOGE0YWJmOTBk
MTYzNjRkMjU4NGIgKCJ4ZW4vYmxrZnJvbnQ6IGNsZWFudXAKPj4+IHN0YWxlIHBlcnNpc3RlbnQg
Z3JhbnRzIikgaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gYXMgcHVyZ2VkIHBlcnNpc3RlbnQKPj4+
IGdyYW50cyB3ZXJlIG5vdCBwdSBpbnRvIHRoZSBsaXN0IG9mIGZyZWUgZ3JhbnRzIGFnYWluLiBD
b3JyZWN0IHRoYXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8IDQg
KystLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgYi9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+PiBpbmRleCBhNzFkODE3ZTkwMGQuLjQyOWQyMDEz
MWM3ZSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPj4+ICsr
KyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPj4+IEBAIC0yNjcwLDggKzI2NzAsOCBA
QCBzdGF0aWMgdm9pZCBwdXJnZV9wZXJzaXN0ZW50X2dyYW50cyhzdHJ1Y3QgYmxrZnJvbnRfaW5m
byAqaW5mbykKPj4+ICAJCQlsaXN0X2RlbCgmZ250X2xpc3RfZW50cnktPm5vZGUpOwo+Pj4gIAkJ
CWdudHRhYl9lbmRfZm9yZWlnbl9hY2Nlc3MoZ250X2xpc3RfZW50cnktPmdyZWYsIDAsIDBVTCk7
Cj4+PiAgCQkJcmluZm8tPnBlcnNpc3RlbnRfZ250c19jLS07Cj4+PiAtCQkJX19mcmVlX3BhZ2Uo
Z250X2xpc3RfZW50cnktPnBhZ2UpOwo+Pj4gLQkJCWtmcmVlKGdudF9saXN0X2VudHJ5KTsKPj4+
ICsJCQlnbnRfbGlzdF9lbnRyeS0+Z3JlZiA9IEdSQU5UX0lOVkFMSURfUkVGOwo+Pj4gKwkJCWxp
c3RfYWRkX3RhaWwoJmdudF9saXN0X2VudHJ5LT5ub2RlLCAmcmluZm8tPmdyYW50cyk7Cj4+IFNv
cnJ5LCBJIGRvbid0IGZvbGxvdyB0aGlzLiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHJlbW92aW5n
IHRoZSBncmFudAo+PiBmcm9tIHJpbmZvLT5ncmFudHMgbGlzdCB3aXRoIGxpc3RfZGVsKCkgYW5k
IHRoZW4gYWRkaW5nIGl0IGJhY2sgd2l0aAo+PiBsaXN0X2FkZF90YWlsKCk/Cj4gVGhlIHBlcnNp
c3RlbnQgZ3JhbnRzIGFyZSBhdCB0aGUgbGlzdCBoZWFkIGFuZCB0aGUgbm9uLXBlcnNpc3RlbnQg
b25lcwo+IGF0IHRoZSB0YWlsLgoKT2gsIEkgZGlkbid0IHJlYWxpemUgdGhhdC4gQnV0IGlzbid0
IHRoYXQgYW4gb3B0aW1pemF0aW9uIChhbmQgc28gbm90CmZvbGxvd2luZyB0aGlzIHJ1bGUgc2hv
dWxkIG5vdCBjYXVzZSBlcnJvcnMpPwoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
