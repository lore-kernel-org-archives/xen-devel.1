From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Mon, 15 Oct 2018 13:50:50 +0100
Message-ID: <12a4352a-2fd1-2d04-874a-4a779d18a097@arm.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
 <alpine.DEB.2.10.1810111024390.436@sstabellini-ThinkPad-X260>
 <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
 <alpine.DEB.2.10.1810121035440.436@sstabellini-ThinkPad-X260>
 <CADJ6SV3jk=nnP=6T8R+OuvJH2uQ6uBrLmvudAHkKHP+mN-3hPA@mail.gmail.com>
 <e0f4fe11-eeb0-3a28-2e7e-246a8f72da19@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q5c5=m3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gC2Ks-0002ln-CN
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 12:51:02 +0000
In-Reply-To: <e0f4fe11-eeb0-3a28-2e7e-246a8f72da19@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>, stefano.stabellini@xilinx.com
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

KFJlc2VuZGluZyB3aXRoIGEgZGlmZmVyZW50IGFkZHJlc3MpCgpPbiAxNS8xMC8yMDE4IDA5OjE0
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24gMTAvMTMvMjAxOCAwNTowMSBQTSwgTWls
YW4gQm9iZXJpYyB3cm90ZToKPj4gSGksCj4gCj4gSGksCj4gCj4+Cj4+PiBEb24ndCBpbnRlcnJ1
cHQgX2NvbWVfIGZyb20gaGFyZHdhcmUgYW5kIGdvL2FyZSByb3V0ZWQgdG8KPj4+IGh5cGVydmlz
b3Ivb3MvYXBwPwo+PiBZZXMgdGhleSBkbywgc29ycnksIEkgcmV2ZXJzZWQgdGhlIG9yZGVyIGJl
Y2F1c2UgSSdtIGEgbmV3YmllIDopIC4KPj4KPj4+IFdvdWxkIHlvdSBtaW5kIHRvIGV4cGxhaW4g
d2hhdCBpcyB0aGUgdHJpcGxlIHRpbWVyIGNvdW50ZXI/Cj4+IE9uIHRoaXMgbGluayBvbiBwYWdl
IDM0MiBpcyBleHBsYW5hdGlvbi4KPiAKPiBXaGljaCBsaW5rPwo+IAo+Pgo+Pj4gVGhpcyBpcyBu
b3QgdGhlIG9mZmljaWFsIFhlbiByZXBvc2l0b3J5IGFuZCBsb29rIGxpa2UgcGF0Y2hlcyBoYXZl
IAo+Pj4gYmVlbiBhcHBsaWVkIG9uIHRvcC4gSSBhbSBhZnJhaWQsIEkgYW0gbm90IGdvaW5nIHRv
IGJlIGFibGUgaGVscCAKPj4+IGhlcmUuIENvdWxkIHlvdSBkbyB0aGUgc2FtZSBleHBlcmltZW50
IHdpdGggWGVuIDQuMTE/Cj4+Cj4+IEkgdGhpbmsgSSBoYXZlIHRvIGdldCBYZW4gZnJvbSBYaWxp
bnggYmVjYXVzZSBJIHVzZSBib2FyZCB0aGF0IGhhcwo+PiBaeW5xIFVsdHJhc2NhbGUuIFN0ZWZh
bm8gc2VudCBicmFuY2ggd2l0aCBYZW4gNC4xMSBzbyBJIGJ1aWx0IHdpdGggaXQuCj4gCj4gVGhl
IGJvYXJkIHNob3VsZCBiZSBmdWxseSBzdXBwb3J0ZWQgdXBzdHJlYW1lZC4gSWYgWGlsaW54IGhh
cyBtb3JlIHBhdGNoIAo+IG9uIHRvcCwgdGhlbiB5b3Ugd291bGQgbmVlZCB0byBzZWVrIHN1cHBv
cnQgZnJvbSB0aGVtIGJlY2F1c2UgSSBkb24ndCAKPiBrbm93IHdoYXQgdGhleSBjaGFuZ2VkIGlu
IFhlbi4KPiAKPiBDaGVlcnMsCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
