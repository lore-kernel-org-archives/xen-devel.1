From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 4/5] ALSA: xen-front: Implement handling
 of shared buffers
Date: Tue, 17 Apr 2018 13:15:51 +0200
Message-ID: <7abbbaa0-93c7-5c93-d653-ed5a04199f6e__9746.24503073773$1523963672$gmane$org@suse.com>
References: <20180416062453.24743-1-andr2000@gmail.com>
 <20180416062453.24743-5-andr2000@gmail.com>
 <6ab76dd7-ec6b-0756-5490-f5b5805998d6@suse.com>
 <edbd53c6-3396-9293-4a04-2b22655eeb12@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8OaY-0003gz-Cu
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 11:15:54 +0000
In-Reply-To: <edbd53c6-3396-9293-4a04-2b22655eeb12@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, perex@perex.cz, tiwai@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMTE6MjIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IE9uIDA0
LzE2LzIwMTggMDQ6MzkgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDE2LzA0LzE4IDA4
OjI0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+ICtzdGF0aWMgaW50IGFsbG9j
X2ludF9idWZmZXJzKHN0cnVjdCB4ZW5fc25kX2Zyb250X3NoYnVmICpidWYsCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IG51bV9wYWdlc19kaXIsIGludCBudW1fcGFn
ZXNfYnVmZmVyLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBudW1f
Z3JlZnMpCj4+PiArewo+Pj4gK8KgwqDCoCBidWYtPmdyZWZzID0ga2NhbGxvYyhudW1fZ3JlZnMs
IHNpemVvZigqYnVmLT5ncmVmcyksIEdGUF9LRVJORUwpOwo+Pj4gK8KgwqDCoCBpZiAoIWJ1Zi0+
Z3JlZnMpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+PiArCj4+PiArwqDC
oMKgIGJ1Zi0+ZGlyZWN0b3J5ID0ga2NhbGxvYyhudW1fcGFnZXNfZGlyLCBYRU5fUEFHRV9TSVpF
LCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqAgaWYgKCFidWYtPmRpcmVjdG9yeSkKPj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIGZhaWw7Cj4+PiArCj4+PiArwqDCoMKgIGJ1Zi0+YnVmZmVyX3N6ID0g
bnVtX3BhZ2VzX2J1ZmZlciAqIFhFTl9QQUdFX1NJWkU7Cj4+PiArwqDCoMKgIGJ1Zi0+YnVmZmVy
ID0gYWxsb2NfcGFnZXNfZXhhY3QoYnVmLT5idWZmZXJfc3osIEdGUF9LRVJORUwpOwo+Pj4gK8Kg
wqDCoCBpZiAoIWJ1Zi0+YnVmZmVyKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbDsKPj4+
ICsKPj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+PiArCj4+PiArZmFpbDoKPj4+ICvCoMKgwqAga2Zy
ZWUoYnVmLT5ncmVmcyk7Cj4+PiArwqDCoMKgIGJ1Zi0+Z3JlZnMgPSBOVUxMOwo+Pj4gK8KgwqDC
oCBrZnJlZShidWYtPmRpcmVjdG9yeSk7Cj4+IFdoeSBkbyB5b3UgbmVlZCB0byBmcmVlIHRob3Nl
IGhlcmU/IFNob3VsZG4ndCB0aGF0IGJlIGRvbmUgdmlhCj4+IHhlbl9zbmRfZnJvbnRfc2hidWZf
ZnJlZSgpIGluIGNhc2Ugb2YgYW4gZXJyb3I/Cj4gQXQgdGhpcyBwbGFjZSB3ZSBvbmx5IGFsbG9j
YXRlIG1lbW9yeSwgYnV0IHhlbl9zbmRfZnJvbnRfc2hidWZfZnJlZQo+IHdpbGwgYWxzbyB0cnkg
dG8gZ250dGFiX2VuZF9mb3JlaWduX2FjY2VzcyBpZiBidWYtPmdyZWZzICE9IE5VTEwuCgpPa2F5
LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
