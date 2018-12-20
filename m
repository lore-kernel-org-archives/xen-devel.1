From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V11 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Thu, 20 Dec 2018 15:22:17 +0000
Message-ID: <3f4ea207-2c8a-3f05-9608-6fd64479aa76@citrix.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-5-git-send-email-rcojocaru@bitdefender.com>
 <5C07FD4302000078002033AF@prv1-mh.provo.novell.com>
 <5e22ea77-26f9-be55-c30f-8a598cd35218@bitdefender.com>
 <5C1237EF0200007800205C8F@prv1-mh.provo.novell.com>
 <f3da63c2-ec2d-e7fb-468b-3faf8cf9c67b@citrix.com>
 <5C1B50D60200007800207E4D@prv1-mh.provo.novell.com>
 <efa718ea-8fdc-0803-704f-5628c3b3a10e@citrix.com>
 <5C1B9E8402000078002080F4@prv1-mh.provo.novell.com>
 <49204ce7-bb5f-2aad-a2b8-a2219db89260@citrix.com>
 <5C1BAC170200007800208176@prv1-mh.provo.novell.com>
 <6e9d24c0-92d0-43be-d490-f3ccaba7e8be@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z86S=O5=citrix.com=prvs=885450f5c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ga0Cr-0008FT-2d
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:25:49 +0000
In-Reply-To: <6e9d24c0-92d0-43be-d490-f3ccaba7e8be@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjAvMTggMzoxNCBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDEyLzIwLzE4
IDQ6NDkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMC4xMi4xOCBhdCAxNTozOCwg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBDYW4gd2UganVzdCBmb3Igbm93
IHRha2UgdGhlIHRleHQgYXMgSSBwcm9wb3NlZCBpdD8gIFlvdSBjYW4gYXJndWUgYWJvdXQKPj4+
IHRoZSByaWdodCB0aGluZyB0byBkbyB3aGVuIHdlIGRvIHRoZSBhbGxlZ2VkIGNsZWFuLXVwLgo+
Pgo+PiBXaXRoIHRoZSAiV2Ugc2hvdWxkIHByb2JhYmx5IHJldHVybiBhbiBlcnJvciAuLi4iIHBh
cnQgZHJvcHBlZAo+PiBvciByZXBsYWNlZCBieSBlLmcuICJXZSBzaG91bGQgcmV2aXNpdCB0aGlz
IiB0aGlzIHdvdWxkIGJlIG9rYXkKPj4gd2l0aCBtZS4gQnV0IHlvdSdyZSB0aGUgbWFpbnRhaW5l
ciBvZiB0aGUgY29kZSBhbnl3YXkuLi4KPiAKPiBJcyB0aGUgY2hhbmdlIHNvbWV0aGluZyB0aGF0
IGNhbiBiZSBkb25lIG9uIGNvbW1pdCAoaWYgdGhlcmUgYXJlIG5vCj4gb3RoZXIgb2JqZWN0aW9u
cyBvZiBjb3Vyc2UpLCBvciBzaG91bGQgSSByZS1zdWJtaXQgdGhlIHNlcmllcyB3aXRoIHRoZQo+
IGNvbW1lbnQgY2hhbmdlZD8KCldlbGwgSSBoYXZlbid0IGdpdmVuIGEgcmV2aWV3IG9mIHlvdXIg
Y2hhbmdlcyB0byB2NCB5ZXQ7IHRoaXMgd2FzIGp1c3QKdHJ5aW5nIHRvIGFuc3dlciBKYW4ncyBx
dWVzdGlvbiBhYm91dCB3aGF0IGlkZWFsIGludGVyZmFjZSB3b3VsZCBiZS4KCklmIGl0J3MganVz
dCBjb21tZW50cyBJIGNhbiBmaXggdGhpbmdzIHVwIG9uIGNoZWNrLWluLgoKIC1HZW9yZ2UKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
