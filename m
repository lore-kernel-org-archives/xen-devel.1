From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v5 0/3] x86: make rsdp address accessible
 via boot params
Date: Wed, 10 Oct 2018 09:19:18 +0200
Message-ID: <20181010071918.GA103159__44164.5560822964$1539155903$gmane$org@gmail.com>
References: <20181010061456.22238-1-jgross@suse.com>
 <20181010062352.GC37224@gmail.com>
 <12afa65a-9e07-bb2c-5621-85074ea37135@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0ctk=mw=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1gA8mD-0000Ft-Jp
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 07:19:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id n11-v6so4325414wru.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Oct 2018 00:19:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <12afa65a-9e07-bb2c-5621-85074ea37135@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: corbet@lwn.net, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com, Kees Cook <keescook@chromium.org>
List-Id: xen-devel@lists.xenproject.org

CiogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKCj4gWW91IGNhbiBqdXN0
IGRpdmUgaW50byB0aGUgZGlzY3Vzc2lvbiB3ZSBoYWQgYmFjayBpbiBGZWJydWFyeToKClRoYXQg
d2FzIGhhbGYgYSB5ZWFyIGFuZCBhIHRob3VzYW5kIGNvbW1pdHMgYWdvISA7LSkKCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE4MDIxMzE2MzI0NC5qMnp1eHloczRrYmZod2dqQGdt
YWlsLmNvbS8KPiAKPiBUaGUgc2NoZW1lIEkgaGF2ZSB1c2VkIGluIFY1IG9mIHRoZSBzZXJpZXMg
aXMgdGhlIG9uZSB5b3UgYWdyZWVkIHRvIHVzZQo+IGJhY2sgdGhlbi4KPiAKPiBBIHF1aWNrIHN1
bW1hcnkgb2YgdGhlIHByb2JsZW0geW91IG1lbnRpb25lZDoKPiAKPiBUaGVyZSBhcmUgc29tZSBk
b3duc3RyZWFtIHZhcmlhbnRzIG9mIGdydWIyIHdpdGggYSBwYXRjaCBicmVha2luZyB0aGUKPiBi
b290IHByb3RvY29sIGJ5IHdyaXRpbmcgZ2FyYmFnZSBwYXN0IHRoZSBlbmQgb2Ygc2V0dXBfaGVh
ZGVyLiBBZGRpbmcKPiBhIG5ldyBmaWVsZCBhdCB0aGUgZW5kIG9mIHNldHVwX2hlYWRlciAoaGVy
ZTogcnNkcF9hZGRyZXNzKSByZXN1bHRlZCBpbgo+IHRob3NlIGdydWIyIHZhcmlhbnRzIGNsb2Ji
ZXJpbmcgdGhlIHByZXNldCB2YWx1ZSBvZiAwLgo+IAo+IFRoZSBzb2x1dGlvbiBpcyB0byBsZXQg
Z3J1YjIgcmVwb3J0IGJhY2sgdGhlIHVzZWQgYm9vdCBwcm90b2NvbCB2ZXJzaW9uCj4gd2l0aCBz
ZXR0aW5nIGEgZmxhZyAiSSBhbSByZXBvcnRpbmcgYmFjayBteSB2ZXJzaW9uIi4gVGhlIGtlcm5l
bCBub3cgaXMKPiBjYXBhYmxlIHRvIGtub3cgd2hpY2ggZmllbGRzIG9mIHNldHVwX2hlYWRlciBh
cmUga25vd24gdG8gZ3J1YjIgYW5kIGNhbgo+IGFjdCBhY2NvcmRpbmdseS4KPiAKPiBUaGUgcmVs
YXRlZCBncnViMiBwYXRjaCBzZXJpZXMgaXMgdW5kZXIgcmV2aWV3IHJpZ2h0IG5vdy4KCk9rLCB0
aGF0J3MgcmVhc3N1cmluZyAtIHRoYXQncyBhbGwgdGhlIGNvbnRleHQgSSBuZWVkZWQuCgpXb3Vs
ZCBpdCBoZWxwIGdydWIyIHJldmlldytpbnRlZ3JhdGlvbiBpZiB3ZSBhcHBsaWVkIHRoaXMgdG8g
LXRpcCBhbmQgc3RhZ2VkCml0IHRoZXJlIHVudGlsIHRoZSBHcnViIHBhdGNoZXMgYXJlIGFjY2Vw
dGVkLCBvciBjYW4gSSBjb25zaWRlciB0aG9zZSBjaGFuZ2VzCmFzIGdydWIyIHVwc3RyZWFtIGFj
Y2VwdGVkPwoKSSdkIGxpa2UgdG8gaGVscCBtYWtlIGl0IGhhcHBlbiwgbGV0IG1lIGtub3cgd2hh
dCB0aGUgYmVzdCByb3V0ZSBpcy4KClRoYW5rcywKCglJbmdvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
