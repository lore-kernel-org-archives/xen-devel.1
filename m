From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Wed, 14 Nov 2018 10:45:07 +0000
Message-ID: <508d2a46-a275-8a8f-087e-4b953b942425@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d186185e-bd34-0603-37e1-aa2d843c9b08@arm.com>
 <alpine.DEB.2.10.1811131237341.8259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aca3=nz=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gMsfY-00077I-RT
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 10:45:12 +0000
In-Reply-To: <alpine.DEB.2.10.1811131237341.8259@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Xen Devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMy8xMS8yMDE4IDIwOjM5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhvd2V2ZXIsIHdoYXQg
aXMgdGhlIGlzc3VlIHdpdGggc2F2aW5nIGFsbCB0aGUgcmVnaXN0ZXJzIGhlcmU/Cj4+Pj4KPj4+
Cj4+PiBXZSBuZWVkIHRvIHNhdmUgYXJndW1lbnRzIHRoYXQgYXJlIHByb3ZpZGVkIGJ5IGEgZ3Vl
c3Qgd2l0aCBzeXN0ZW0KPj4+IHN1c3BlbmQgUFNDSSBjYWxsLiBUaGVzZSBhcmd1bWVudHMgYXJl
IHRoZSBlbnRyeSBwb2ludCB0aGF0IG5lZWRzIHRvCj4+PiBiZSBzYXZlZCBpbiBwcm9ncmFtIGNv
dW50ZXIgYW5kIGNvbnRleHQgSUQgdGhhdCBuZWVkcyB0byBiZSBzYXZlZCBpbgo+Pj4geDAvcjAu
IFdlIGRvbid0IGhhdmUgdGhlc2UgYXJndW1lbnRzIGhlcmUuIENvbnRleHQgc3dpdGNoIGhhcHBl
bnMKPj4+IGFmdGVyIHByb2Nlc3NpbmcgdGhlIHN5c3RlbSBzdXNwZW5kIFBTQ0kgY2FsbCwgc28g
aXQncyB0b28gbGF0ZS4KPj4KPj4gSXQgZG9lcyBub3QgZmVlbCByaWdodCB0byBtb2RpZnkgY3R4
dF9zd2l0Y2h7ZnJvbSx0b30gZm9yIHN1c3BlbmQvcmVzdW1lLiBJZgo+PiB5b3Ugd2FudCB0byBy
ZXNldCB0aGUgdkNQVSBzdGF0ZSBiZWZvcmUgYmxvY2tpbmcgdGhlIHZDUFUsIHRoZW4geW91IHNo
b3VsZAo+PiBpbnN0ZWFkCj4gCj4gWW91IG1pc3NlZCB0aGUgZW5kIG9mIHRoZSBzdWdnZXN0aW9u
IGhlcmUKCldob29wcy4gSSBtZWFudCB0aGF0IGluc3RlYWQgeW91IHNob3VsZCBzYXZlIHRoZSBj
b250ZXh0IG9mIHRoZSB2Q1BVIGluIGFkdmFuY2UgCm9yIHJlc2V0IHRoZSB2Q1BVIHVzaW5nIHRo
ZSBzeXN0ZW0gcmVnaXN0ZXJzIGRpcmVjdGx5LgoKQnV0IG15IHByZWZlcmVuY2UgaXMgdG8gcmVz
ZXQgdGhlIHZDUFUgd2hlbiB5b3UgcmVjZWl2ZSB0aGUgd2FrZS11cCBpbnRlcnJ1cHQuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
