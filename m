From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 15/19] Add clk_ignore_unused for
	stretch for arm hosts
Date: Wed, 7 Mar 2018 14:50:26 +0000
Message-ID: <23199.64562.740687.82663@mariner.uk.xensource.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-16-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yqaj=f5=citrix.com=prvs=597a3b2b9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1etaOs-0002IB-Gp
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 14:50:38 +0000
In-Reply-To: <20171031135203.11537-16-wei.liu2@citrix.com>
 <54636E1A.50504@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbT1NTVEVTVCBQQVRDSCB2MiAxNS8xOV0gQWRkIGNsa19pZ25vcmVf
dW51c2VkIGZvciBzdHJldGNoIGZvciBhcm0gaG9zdHMiKToKPiBXaXRob3V0IHRoYXQgcGFyYW1l
dGVyIHdlIGxvc2UgdWFydCBvdXRwdXQuCgpJbiB0aGlzIHBhdGNoIHdlIGFyZSBwcm9wYWdhdGlu
ZyBhIHdvcmthcm9vdW5kIGZ1cnRoZXIgaW50byB0aGUKZnV0dXJlLiAgVGhpcyBpcyBhbiBvcHBv
cnR1bml0eSB0byBwcm9kIHRoZSBwZW9wbGUgcmVzcG9uc2libGUgZm9yIHRoZQpidWcuCgpKdWxp
ZW4sIGlzIHRoaXMgd29ya2Fyb3VuZCBzdGlsbCBuZWVkZWQgPwpJZiBzbywgd2hhdCBhcmUgdGhl
IHBsYW5zIGZvciBhIHByb3BlciBmaXggPwoKQnV0LCB0aGUgb3NzdGVzdCBwYXRjaCBpcwoKQWNr
ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtzLApJ
YW4uCgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0t
Cj4gIE9zc3Rlc3QvRGViaWFuLnBtIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0g
Yi9Pc3N0ZXN0L0RlYmlhbi5wbQo+IGluZGV4IGU3ZmIwMjAuLjJiZmQ1YWUgMTAwNjQ0Cj4gLS0t
IGEvT3NzdGVzdC9EZWJpYW4ucG0KPiArKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQo+IEBAIC0yNDAs
NyArMjQwLDcgQEAgRU5ECj4gIAlwdXNoIEB4ZW5rb3B0LCAkeGVua29wdDsKPiAgCSMgaHR0cDov
L2J1Z3MueGVucHJvamVjdC5vcmcveGVuL2J1Zy80NQo+ICAJcHVzaCBAeGVua29wdCwgImNsa19p
Z25vcmVfdW51c2VkIgo+IC0JICAgIGlmICRoby0+e1N1aXRlfSA9fiBtL3doZWV6eXxqZXNzaWUv
Owo+ICsJICAgIGlmICRoby0+e1N1aXRlfSA9fiBtL3doZWV6eXxqZXNzaWV8c3RyZXRjaC87Cj4g
IAo+ICAJJHhlbmtvcHQgPSBqb2luICcgJywgQHhlbmtvcHQ7Cj4gIAlsb2dtKCJEb20wIExpbnV4
IG9wdGlvbnM6ICR4ZW5rb3B0Iik7Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
