From: Peng Fan <peng.fan@nxp.com>
Subject: Question, How to share interrupt between Doms
Date: Tue, 2 Oct 2018 08:32:51 +0000
Message-ID: <AM0PR04MB4481BE6F43F69452BE68C8AD88E80@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgzi=mo=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1g7G71-0007yw-U1
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 08:33:00 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLCBTdGVmYW5vLAoKRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0
byBzaGFyZSBvbmUgaW50ZXJydXB0IGJldHdlZW4gRG9tcz8KVGhlIGlzc3VlIGlzIHRoYXQgYSBn
cGlvIGNvbnRyb2xsZXIgaGFzIDMyIGluL291dCBwb3J0LCBob3dldmVyIGl0IG9ubHkgaGFzIG9u
ZSBiaW5kZWQgaW50ZXJydXB0LiBUaGUgaW50ZXJydXB0IGhhbmRsZXIgbmVlZHMgdG8gY2hlY2sg
dGhlIHN0YXR1cyBiaXRzIHRvIGNoZWNrIHdoaWNoIHBvcnQgaGFzIGludGVycnVwdCBjb21pbmcu
CkluIG15IGNhc2UsIHRoZXJlIGFyZSBkaWZmZXJlbnQgZGV2aWNlcyB1c2luZyBncGlvIGludGVy
cnVwdCB0aGF0IG5lZWRzIHRvIGJlIGFzc2lnbmVkIHRvIGRpZmZlcmVudCBkb21zLgoKVGhhbmtz
LApQZW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
