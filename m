From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH RFC v2 2/2] x86/emulate: Send vm_event from
 emulate
Date: Fri, 11 Jan 2019 09:38:31 -0700
Message-ID: <CABfawhmTDkezeEp8QTS8Az88O3qDGuK1EfA1Yf2xK0UUGzzXoA@mail.gmail.com>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
 <20190111153657.13532-2-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1v5S=PT=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ghzpw-0007lu-Af
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 16:39:12 +0000
Received: by mail-ed1-f67.google.com with SMTP id b3so13655269ede.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 08:39:10 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id r51sm2530917eda.64.2019.01.11.08.39.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jan 2019 08:39:09 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id v13so15868160wrw.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 08:39:08 -0800 (PST)
In-Reply-To: <20190111153657.13532-2-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgODozNyBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhaW1zIHRvIGhh
dmUgbWVtIGFjY2VzcyB2bSBldmVudHMgc2VudCBmcm9tIHRoZSBlbXVsYXRvci4KPiBUaGlzIGlz
IHVzZWZ1bCBpbiB0aGUgY2FzZSBvZiBwYWdlLXdhbGtzIHRoYXQgaGF2ZSB0byBlbXVsYXRlCj4g
aW5zdHJ1Y3Rpb25zIGluIGFjY2VzcyBkZW5pZWQgcGFnZXMuCj4KCkknbSBhIGxpdHRsZSBjb25m
dXNlZCBhYm91dCB0aGUgc2NlbmFyaW8geW91IG1lbnRpb24gaGVyZS4gWW91IG1hcmsKcGFnZXMg
d2hlcmUgdGhlIHBhZ2V0YWJsZXMgYXJlIG5vbi1yZWFkYWJsZS93cml0YWJsZSBpbiBFUFQgYW5k
IHlvdQpleHBlY3QgdGhlIGVtdWxhdGVkIGluc3RydWN0aW9uIHdvdWxkIGFsc28gdmlvbGF0ZSBh
Y2Nlc3MgcGVybWlzc2lvbnMKb2YgdGhlIGd1ZXN0IHBhZ2V0YWJsZSBpdHNlbGY/CgpUaGFua3Ms
ClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
