From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] xen: sched: Credit2: avoid looping too much
 (over runqueues) during load balancing
Date: Wed, 21 Nov 2018 15:31:51 +0000
Message-ID: <54ab6b91-646f-5cf3-a98a-7a434546d751@citrix.com>
References: <153926567611.23011.10706214055586822546.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=azpx=oa=citrix.com=prvs=856900a8f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gPUTr-0002PR-4J
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 15:31:55 +0000
In-Reply-To: <153926567611.23011.10706214055586822546.stgit@wayrath>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTEvMTggMjo0NyBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gRm9yIGRvaW5nIGxv
YWQgYmFsYW5jaW5nIGJldHdlZW4gcnVucXVldWVzLCB3ZSBjaGVjayB0aGUgbG9hZCBvZiBlYWNo
Cj4gcnVucXVldWUsIHNlbGVjdCB0aGUgb25lIG1vcmUgImRpc3RhbnQiIHRoYW4gb3VyIG93biBs
b2FkLCBhbmQgdGhlbiB0YWtlCj4gdGhlIHByb3BlciBydW5xIGxvY2sgYW5kIGF0dGVtcHQgdmNw
dSBtaWdyYXRpb25zLgo+IAo+IElmIHdlIGZhaWwgdG8gdGFrZSBzdWNoIGxvY2ssIHdlIHRyeSBh
Z2FpbiwgYW5kIHRoZSBpZGVhIHdhcyB0byBnaXZlIHVwCj4gYW5kIGJhaWwgaWYsIGR1cmluZyB0
aGUgY2hlY2tpbmcgcGhhc2UsIHdlIGNhbid0IHRha2UgdGhlIGxvY2sgb2YgYW55Cj4gcnVucXVl
dWUgKGNoZWNrIHRoZSBjb21tZW50IG5lYXIgdG8gdGhlICdnb3RvIHJldHJ5OycsIGluIHRoZSBt
aWRkbGUgb2YKPiBiYWxhbmNlX2xvYWQoKSkKPiAKPiBIb3dldmVyLCB0aGUgdmFyaWFibGUgdGhh
dCBjb250cm9scyB0aGUgImdpdmUgdXAgYW5kIGJhaWwiIHBhcnQsIGlzIG5vdAo+IHJlc2V0IHVw
b24gcmV0cmllcy4gVGhlcmVmb3JlLCBwcm92aWRlZCB3ZSBkaWQgbWFuYWdlIHRvIGNoZWNrIHRo
ZSBsb2FkIG9mCj4gYXQgbGVhc3Qgb25lIHJ1bnF1ZXVlIGR1cmluZyB0aGUgZmlyc3QgcGFzcywg
aWYgd2UgY2FuJ3QgZ2V0IGFueSBydW5xIGxvY2ssCj4gd2UgZG9uJ3QgYmFpbCwgYnV0IHdlIHRy
eSBhZ2FpbiB0YWtpbmcgdGhlIGxvY2sgb2YgdGhhdCBzYW1lIHJ1bnF1ZXVlCj4gKGFuZCB0aGF0
IG1heSBldmVuIG1vcmUgdGhhbiBvbmNlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdn
aW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KClNvcnJ5IGZvciB0aGUgZGVsYXkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
