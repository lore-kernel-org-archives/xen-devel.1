From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] xen: drop in_atomic()
Date: Wed, 22 May 2019 10:58:25 +0100
Message-ID: <6250d30e-dd9a-4fa9-7934-1f90948d8dad@citrix.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bu0R=TW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTO10-0007k1-Ra
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:58:30 +0000
In-Reply-To: <20190522094549.28397-2-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMDo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDdXJyZW50bHkgdGhl
cmUgaXMgb25seSBvbmUgdXNlciBvZiBpbl9hdG9taWMoKSwgYW5kIHRoYXQgaXMgaW4gYW4KPiAj
aWZkZWYgMCBzZWN0aW9uLiBUaGlzIGhhcyBiZWVuIHNvIHNpbmNlIFhlbiA0LjEsIHNvIGNoYW5j
ZXMgYXJlCj4gcmF0aGVyIHNsaW0gd2Ugc3VkZGVubHkgd2FudCB0byBlbmFibGUgaXQgYWdhaW4u
Cj4KPiBEcm9wcGluZyBpbl9hdG9taWMoKSB3aWxsIHJlbW92ZSB0aGUgbGFzdCB1c2VyIG9mIHBy
ZWVtcHRfY291bnQoKQo+IGluIG5vbi1kZWJ1ZyBidWlsZHMgZW5hYmxpbmcgZnVydGhlciBvcHRp
bWl6YXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpUaGlzIGNvZGUgaGFzIG5ldmVyIGJlZW4gdXNlZCBhbmQgaXMgb2J2aW91c2x5IG5vdCBk
b2luZyBhbnl0aGluZyB1c2VmdWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
