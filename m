From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 4/9] nospec: introduce
 evaluate_nospec
Date: Thu, 21 Feb 2019 09:47:16 +0000
Message-ID: <8cc5ac14-27fc-5a1e-6b66-42ba901921d4@arm.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-5-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/sLC=Q4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gwkwr-0000cR-NJ
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 09:47:21 +0000
In-Reply-To: <1550737003-25779-5-git-send-email-nmanthey@amazon.de>
Content-Language: en-US
Content-ID: <5BD51846BE148540989F9C493E86D264@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, nd <nd@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>, David Woodhouse <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

SGkgTm9yYmVydCwNCg0KT24gMjEvMDIvMjAxOSAwODoxNiwgTm9yYmVydCBNYW50aGV5IHdyb3Rl
Og0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9ub3NwZWMuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbm9zcGVjLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL25vc3BlYy5oDQo+IEBAIC0wLDAgKzEs
MjAgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ICsvKiBD
b3B5cmlnaHQgMjAxOCBBbWF6b24uY29tLCBJbmMuIG9yIGl0cyBhZmZpbGlhdGVzLiBBbGwgUmln
aHRzIFJlc2VydmVkLiAqLw0KPiArDQo+ICsjaWZuZGVmIF9BU01fQVJNX05PU1BFQ19IDQo+ICsj
ZGVmaW5lIF9BU01fQVJNX05PU1BFQ19IDQo+ICsNCj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVj
KGNvbmRpdGlvbikgKGNvbmRpdGlvbikNCj4gKw0KPiArI2RlZmluZSBibG9ja19zcGVjdWxhdGlv
bigpDQoNCk5JVDogQ291bGQgeW91IHR1cm4gdGhpcyB0byBhIHN0YXRpYyBpbmxpbmU/DQoNCldp
dGggdGhhdCBmb3IgdGhlIEFybSBjb2RlOg0KDQpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
