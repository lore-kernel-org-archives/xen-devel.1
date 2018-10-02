From: Julien Grall <julien.grall@arm.com>
Subject: Re: Question, How to share interrupt between Doms
Date: Tue, 2 Oct 2018 17:02:39 +0100
Message-ID: <3b53af1e-e14e-b35c-1118-8af134dec9db@arm.com>
References: <AM0PR04MB4481BE6F43F69452BE68C8AD88E80@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf1e=mo=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g7N8F-0004wh-JE
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 16:02:43 +0000
In-Reply-To: <AM0PR04MB4481BE6F43F69452BE68C8AD88E80@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMjAxOCAwOTozMiwgUGVuZyBGYW4gd3JvdGU6Cj4gSGkgSnVsaWVuLCBTdGVmYW5v
LAoKSGkgUGVuZywKCj4gCj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBz
aGFyZSBvbmUgaW50ZXJydXB0IGJldHdlZW4gRG9tcz8KClNoYXJpbmcgaW50ZXJydXB0cyBhcmUg
dXN1YWxseSBhIHBhaW4uIFlvdSB3b3VsZCBuZWVkIHRvIGZvcndhcmQgdGhlIAppbnRlcnJ1cHRz
IHRvIGFsbCB0aGUgZG9tYWlucyB1c2luZyB0aGF0IGludGVycnVwdCBhbmQgd2FpdCBmb3IgdGhl
bSB0byAKRU9JLiBUaGlzIGhhcyBzZWN1cml0eSBpbXBsaWNhdGlvbnMgYmVjYXVzZSB5b3UgZG9u
J3Qgd2FudCBEb21BIHRvIApwcmV2ZW50IERvbUIgcmVjZWl2aW5nIGFub3RoZXIgaW50ZXJydXB0
IGJlY2F1c2UgdGhlIHByZXZpb3VzIG9uZSBoYXMgCm5vdCBiZWVuIEVPSWVkIGNvcnJlY3RseS4K
Cj4gVGhlIGlzc3VlIGlzIHRoYXQgYSBncGlvIGNvbnRyb2xsZXIgaGFzIDMyIGluL291dCBwb3J0
LCBob3dldmVyIGl0IG9ubHkgaGFzIG9uZSBiaW5kZWQgaW50ZXJydXB0LiBUaGUgaW50ZXJydXB0
IGhhbmRsZXIgbmVlZHMgdG8gY2hlY2sgdGhlIHN0YXR1cyBiaXRzIHRvIGNoZWNrIHdoaWNoIHBv
cnQgaGFzIGludGVycnVwdCBjb21pbmcuCj4gSW4gbXkgY2FzZSwgdGhlcmUgYXJlIGRpZmZlcmVu
dCBkZXZpY2VzIHVzaW5nIGdwaW8gaW50ZXJydXB0IHRoYXQgbmVlZHMgdG8gYmUgYXNzaWduZWQg
dG8gZGlmZmVyZW50IGRvbXMuCgogRnJvbSB3aGF0IHlvdSB3cm90ZSwgaXQgbG9va3MgbGlrZSB5
b3UgZXhwZWN0IHRoZSBHUElPIGNvbnRyb2xsZXIgdG8gYmUgCnNoYXJlZCB3aXRoIG11bHRpcGxl
IGRvbWFpbnMuCgpJIGRvbid0IHRoaW5rIGl0IGlzIHNhZmUgdG8gZG8gdGhhdC4gWW91IG5lZWQg
b25lIGRvbWFpbiAob3IgWGVuKSB0byAKZnVsbHkgbWFuYWdlIHRoZSBjb250cm9sbGVyLiBBbGwg
dGhlIG90aGVyIGRvbWFpbiB3aWxsIGhhdmUgdG8gYWNjZXNzIAplaXRoZXIgYSB2aXJ0dWFsIEdQ
SU8gY29udHJvbGxlciBvciBQViBvbmUuIEluIHRoZSBmb3JtZXIsIGludGVycnVwdCAKd291bGQg
YmUgdmlydHVhbCwgd2hpbGUgdGhlIGxhdHRlciB0aGUgaW50ZXJydXB0IHdvdWxkIGJlIHRocm91
Z2ggZXZlbiAKY2hhbm5lbC4KClNvIHNoYXJpbmcgaW50ZXJydXB0IHNob3VsZCBub3QgYmUgbmVj
ZXNzYXJ5LiBEaWQgSSBtaXNzIGFueXRoaW5nPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
