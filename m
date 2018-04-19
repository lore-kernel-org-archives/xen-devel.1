From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Thu, 19 Apr 2018 16:12:42 +0300
Message-ID: <5ed20b99-263d-d906-9349-d064eead36ad__49464.3310820267$1524143488$gmane$org@gmail.com>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
 <c833ab0d-746c-c734-3dbe-e02ae7951d1d@suse.com>
 <d935e7d9-090f-a8b1-7f12-5e0a7f0adf1b@gmail.com>
 <CAKf6xpsM03AB-mHaYdpVfipRdtx9uO1rS=bHZdEi3fkfTo6b4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jw3m=hi=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f99Mk-00045C-Cn
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 13:12:46 +0000
Received: by mail-lf0-x243.google.com with SMTP id x130-v6so70195lff.9
 for <xen-devel@lists.xenproject.org>; Thu, 19 Apr 2018 06:12:45 -0700 (PDT)
In-Reply-To: <CAKf6xpsM03AB-mHaYdpVfipRdtx9uO1rS=bHZdEi3fkfTo6b4g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dmitry.torokhov@gmail.com, open list <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTkvMjAxOCAwNDoxMCBQTSwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBUaHUsIEFw
ciAxOSwgMjAxOCBhdCA5OjAxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbwo+IDxhbmRyMjAw
MEBnbWFpbC5jb20+IHdyb3RlOgo+PiBPaywgc28gSSdsbCBzZW5kIHYyIHdpdGggdGhlIGZvbGxv
d2luZyBjaGFuZ2VzOgo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1r
YmRmcm9udC5jCj4+IGIvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jCj4+IGluZGV4
IGEzMzA2YWFkNDBiMC4uZDhjY2EyMTJmNzM3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lucHV0
L21pc2MveGVuLWtiZGZyb250LmMKPj4gKysrIGIvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRm
cm9udC5jCj4+IEBAIC01MSwxMyArNTEsMTMgQEAgbW9kdWxlX3BhcmFtX2FycmF5KHB0cl9zaXpl
LCBpbnQsIE5VTEwsIDA0NDQpOwo+PiAgIE1PRFVMRV9QQVJNX0RFU0MocHRyX3NpemUsCj4+ICAg
ICAgICAgICJQb2ludGluZyBkZXZpY2Ugd2lkdGgsIGhlaWdodCBpbiBwaXhlbHMgKGRlZmF1bHQg
ODAwLDYwMCkiKTsKPj4KPj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQgbm9fcHRyX2RldjsKPj4gLW1v
ZHVsZV9wYXJhbShub19wdHJfZGV2LCB1aW50LCAwKTsKPj4gK3N0YXRpYyBib29sIG5vX3B0cl9k
ZXY7Cj4+ICttb2R1bGVfcGFyYW0obm9fcHRyX2RldiwgYm9vbCwgMCk7Cj4+ICAgTU9EVUxFX1BB
Uk1fREVTQyhub19wdHJfZGV2LAo+PiAgICAgICAgICAiSWYgc2V0IHRoZW4gbm8gdmlydHVhbCBw
b2ludGluZyBkZXZpY2UgZXhwb3NlZCB0byB0aGUgZ3Vlc3QiKTsKPj4KPj4gLXN0YXRpYyB1bnNp
Z25lZCBpbnQgbm9fa2JkX2RldjsKPj4gLW1vZHVsZV9wYXJhbShub19rYmRfZGV2LCB1aW50LCAw
KTsKPj4gK3N0YXRpYyBib29sIG5vX2tiZF9kZXY7Cj4+ICttb2R1bGVfcGFyYW0obm9fa2JkX2Rl
diwgYm9vbCwgMCk7Cj4+ICAgTU9EVUxFX1BBUk1fREVTQyhub19rYmRfZGV2LAo+PiAgICAgICAg
ICAiSWYgc2V0IHRoZW4gbm8gdmlydHVhbCBrZXlib2FyZCBkZXZpY2UgZXhwb3NlZCB0byB0aGUg
Z3Vlc3QiKTsKPiBJIHByZWZlciBkaXJlY3QgbG9naWMgb3ZlciBpbnZlcnNlIGxvZ2ljLiAgTWF5
YmUganVzdCB1c2Uga2JkX2RldiwKPiBkZWZhdWx0IHRvIHRydWUsIGJ1dCBhbGxvdyBpdCB0byBi
ZSBzZXQgb2ZmPwo+Cj4gc3RhdGljIGJvb2wga2JkX2RldiA9IHRydWU7Cj4gbW9kdWxlX3BhcmFt
KGtiZF9kZXYsIGJvb2wsIDApOwpJIGhhdmUgbm8gcHJlZmVyZW5jZSBoZXJlLCBlaXRoZXIgd2F5
IHdvcmtzIGZvciBtZQpKdWVyZ2VuLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGUgYWJvdmU/
Cj4gUmVnYXJkcywKPiBKYXNvbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
