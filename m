From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 11 Apr 2019 03:49:15 -0600
Message-ID: <5CAF0D9B0200007800226882@prv1-mh.provo.novell.com>
References: <20190318131155.29450*1*jgross@suse.com>
 <20190318131155.29450*5*jgross@suse.com>
 <e10c14cd*54ac*8d8c*2d5c*db4adbd39d07@citrix.com>
 <aac2efca-8024-485a-4b8f-8565341c305c@suse.com>
 <5C9BA70E02000078002223A3@suse.com>
 <3067f146-bfc4-1f00-64bf-5750b6486ee1@suse.com>
 <29b8365e-2cae-fec6-0bff-46d014800d80@suse.com>
 <5C9C7FD202000078002225AB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEWMY-0000wD-B3
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 09:51:18 +0000
In-Reply-To: <5C9C7FD202000078002225AB@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDA5OjAzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IEZv
ciBjb3JlIHBhcmtpbmcgSSB3b25kZXIgd2hldGhlciBjb3JlX3BhcmtpbmdfaGVscGVyKCkKPiBz
aG91bGRuJ3QsIGZpcnN0IG9mIGFsbCwgaW52b2tlIGNwdV97dXAsZG93bn1faGVscGVyKCkuIFRo
aXMKPiB3b3VsZG4ndCBiZSBlbm91Z2gsIHRob3VnaCAtIHRoZSBwb2xpY3kgaG9va3MgbmVlZCB0
byBob25vcgo+IG9wdF9zbXQgYXMgd2VsbC4KCkFjdHVhbGx5IG5vLCB0aGVyZSB3YXMgbm8gcHJv
YmxlbSBhdCB0aGUgdGltZSB0aGVyZTogV2l0aApvcHRfc210IHNldCB0byBmYWxzZSwgbm8gc2Vj
b25kYXJ5IHRocmVhZCB3b3VsZCBldmVyIGhhdmUKbWFkZSBpdCBpbnRvIGNvcmVfcGFya2luZ19j
cHVudW1bXSAodGhhdCdzIHdoZXJlIENQVSBudW1iZXJzCnRvIGJlIHBhc3NlZCB0byBjcHVfdXAo
KSBnZXQgdGFrZW4gZnJvbSkuIEEgcHJvYmxlbSBoZXJlIHdhcwppbnRyb2R1Y2VkIG9ubHkgYnkg
QW5kcmV3J3MgMmJlZDFiYzI0MSwgbWFraW5nIGl0IHBvc3NpYmxlIGZvcgpvcHRfc210IHRvIGNo
YW5nZSBhdCBydW50aW1lLiBJIHRoaW5rIEknbGwgbWFrZSBhIHBhdGNoIHRvIGhhdmUKc210X3Vw
X2Rvd25faGVscGVyKCkgY2FsbCBpbnRvIGNvcmUtcGFya2luZyBjb2RlIHRvIHB1cmdlCkNQVXMg
ZnJvbSBjb3JlX3BhcmtpbmdfY3B1bnVtW10gYXMgbmVlZGVkLgoKVGhlIGludGVyYWN0aW9uIG9m
IGNvcmUtcGFya2luZyBhbmQgeGVuLWhwdG9vbCBhY3Rpdml0aWVzIGlzIHVwCmZvciBkaXNjdXNz
aW9uIGFueXdheSwgSSB0aGluay4gQXQgbGVhc3QgdG8gbWUgaXQncyBub3QKaW1tZWRpYXRlbHkg
Y2xlYXIgd2hpY2ggb2YgdGhlIHR3byBzaG91bGQgdGFrZSBwcmlvcml0eS4KQWxsb3dpbmcgYWRt
aW5zIHRvIHNob290IHRoZW1zZWx2ZXMgaW4gdGhlIGZvb3QgKGFzIHdlIGFwcGVhcgp0byBkbyBu
b3cpIGlzIGEgcmVhc29uYWJsZSBwb3NzaWJpbGl0eSwgYnV0IG5vdCB0aGUgb25seSBvbmUsIHRo
ZQptb3JlIHRoYXQgdGhlIHBsYXRmb3JtIGlzIGxpYWJsZSB0byBub3RpY2UgaGlnaGVyIHBvd2Vy
CmNvbnN1bXB0aW9uIGFuZCB0byBzdWJzZXF1ZW50bHkgcmVxdWVzdCBvZmZsaW5pbmcgb2YgQ1BV
cwphZ2FpbiBhbnl3YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
