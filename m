From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Fri, 21 Sep 2018 16:17:41 +0300
Message-ID: <f41f38fd-3522-67d0-74fc-05c440340785@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
 <24239a31-9d31-57dd-06f3-68aba641e263@citrix.com>
 <9019edcd-89c5-4bd7-6ba1-10fa27524fe4@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qbiu=md=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g3LJp-0000sn-KH
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 13:18:01 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 08AF3305FFB5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 16:18:00 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id EACFF7FE6B
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 16:17:59 +0300 (EEST)
In-Reply-To: <9019edcd-89c5-4bd7-6ba1-10fa27524fe4@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Adrian Pop <apop@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMS8xOCA0OjE2IFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gOS8yMC8xOCAz
OjUwIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAwOS8wMy8yMDE4IDA0OjQ4IFBNLCBB
ZHJpYW4gUG9wIHdyb3RlOgo+Pj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRk
ZWZlbmRlci5jb20+Cj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4+PiBA
QCAtNTUwLDYgKzU1MCw1MSBAQCBvdXQ6Cj4+PiAgICAgIHJldHVybiByYzsKPj4+ICB9Cj4+PiAg
Cj4+PiAraW50IHAybV9nZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2Zu
LCBib29sICpzdXBwcmVzc192ZSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgYWx0cDJtX2lkeCkKPj4+ICt7Cj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0
X3AybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmFw
Mm0gPSBOVUxMOwo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtOwo+Pj4gKyAgICBtZm5f
dCBtZm47Cj4+PiArICAgIHAybV9hY2Nlc3NfdCBhOwo+Pj4gKyAgICBwMm1fdHlwZV90IHQ7Cj4+
PiArCj4+PiArICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnRfZXhjZXB0aW9ucyApCj4+PiArICAg
ICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+PiArCj4+PiArICAgIC8qICNWRSBzaG91bGQgYmUg
ZW5hYmxlZCBmb3IgdGhpcyB2Y3B1LiAqLwo+Pj4gKyAgICBpZiAoIGdmbl9lcSh2Y3B1X2FsdHAy
bShjdXJyZW50KS52ZWluZm9fZ2ZuLCBJTlZBTElEX0dGTikgKQo+Pj4gKyAgICAgICAgcmV0dXJu
IC1FTlhJTzsKPj4KPj4gQmFzaWNhbGx5IHRoZSBzYW1lIGNvbW1lbnRzIGFzIGZvciAyLzM6ICBN
b3ZlIHRvIHAybS5jLCBhbmQgZ2V0IHJpZCBvZgo+PiB0aGUgdm14LWlzbS4KPj4KPj4gQW5vdGhy
ZSBpZGVhIGlzIHRvIGdldCByaWQgb2YgdGhlc2UgY2hlY2tzIGFsdG9nZXRoZXIgLS0gcmV0dXJu
aW5nCj4+ICdmYWxzZScgd2hlbiB0aGUgZmVhdHVyZSBpc24ndCBzdXBwb3J0ZWQgb3IgZW5hYmxl
ZCBzaG91bGRuJ3QgYmUgYSBiaWcKPj4gZGVhbC4gIEJ1dCBJIGRvbid0IGZlZWwgc3Ryb25nbHkg
ZW5vdWdoIGFib3V0IGl0IHRvIGFyZ3VlIGVpdGhlciB3YXkuCj4gCj4gSSd2ZSBtb3ZlZCB0aGUg
ZnVuY3Rpb25zIHRvIHAybS5jIGFuZCBzdGFydGVkIG1vdmluZyB0aGUgY2hlY2tzIHdoZW4gaXQK
PiBvY2N1cmVkIHRvIG1lIHRoYXQgaXQgbWlnaHQgYmUgY2hhIHRvIG1vdmUgdGhlbSB0byBlcHRf
Z2V0X2VudHJ5KCkgLwo+IGVwdF9zZXRfZW50cnkoKSBpbiBwMm0tZXB0LmMuCgpTb3JyeSwgd3Jv
dGUgImNoYWxsZW5naW5nIiBoZXJlLCBteSB0b3VjaHBhZCBnb3QgaW4gdGhlIHdheSBhbmQgcmVt
b3ZlZAphIHBhcnQgb2YgdGhlIHdvcmQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
