From: Eric Chanudet <eric.chanudet@gmail.com>
Subject: Re: [PATCH v3 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Thu, 10 Jan 2019 16:41:06 -0500
Message-ID: <20190110214106.aswi6vcsb2bpv2hv@legion>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-10-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nfDD=PS=gmail.com=eric.chanudet@srs-us1.protection.inumbo.net>)
 id 1ghi4c-0007T9-37
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 21:41:10 +0000
Received: by mail-qt1-x841.google.com with SMTP id u47so15596878qtj.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 13:41:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1546846968-7372-10-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, James McKenzie <james@bromium.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDEvMTkgYXQgMTE6NDJwbSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4rbWVtY3B5
X3RvX2d1ZXN0X3Jpbmcoc3RydWN0IGFyZ29fcmluZ19pbmZvICpyaW5nX2luZm8sIHVpbnQzMl90
IG9mZnNldCwKPisgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpzcmMsIFhFTl9HVUVT
VF9IQU5ETEUodWludDhfdCkgc3JjX2huZCwKPisgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCBsZW4pCj4rewo+KyAgICB1bnNpZ25lZCBpbnQgbWZuc19pbmRleCA9IG9mZnNldCA+PiBQQUdF
X1NISUZUOwo+KyAgICB2b2lkICpkc3Q7Cj4rICAgIGludCByZXQ7Cj4rICAgIHVuc2lnbmVkIGlu
dCBzcmNfb2Zmc2V0ID0gMDsKPisKPisgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZyaW5nX2lu
Zm8tPmxvY2spKTsKPisKPisgICAgb2Zmc2V0ICY9IH5QQUdFX01BU0s7Cj4rCj4rICAgIGlmICgg
KGxlbiA+IFhFTl9BUkdPX01BWF9SSU5HX1NJWkUpIHx8IChvZmZzZXQgPiBYRU5fQVJHT19NQVhf
UklOR19TSVpFKSApCj4rICAgICAgICByZXR1cm4gLUVGQVVMVDsKV2l0aCBvZmZzZXQgPCBQQUdF
X1NJWkUgd2l0aCB0aGUgcHJldmlvdXMgbWFzaywgc2hvdWxkbid0IHRoZSBzYW5pdHkKY2hlY2sg
YmU6CiAgICBpZiAobGVuICsgb2Zmc2V0ID4gWEVOX0FSR09fTUFYX1JJTkdfU0laRSkKCi0tIApF
cmljIENoYW51ZGV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
