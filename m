From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 10/11] viridian: add implementation of
 synthetic timers
Date: Wed, 13 Mar 2019 08:10:24 -0600
Message-ID: <5C890F50020000780021E25A@prv1-mh.provo.novell.com>
References: <20190311134132.20536-1-paul.durrant@citrix.com>
 <20190311134132.20536-11-paul.durrant@citrix.com>
 <7c3e8ed8b2de4c3bb8254a97ab15fb4c@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h44aS-0006YG-Aq
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 14:10:28 +0000
In-Reply-To: <7c3e8ed8b2de4c3bb8254a97ab15fb4c@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE0OjA2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0K
Pj4gU2VudDogMTEgTWFyY2ggMjAxOSAxMzo0Mgo+PiAKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vdmlyaWRpYW4uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJp
ZGlhbi5oCj4+IEBAIC00MCw2ICs0MCwzMyBAQCB1bmlvbiB2aXJpZGlhbl9zaW50X21zcgo+PiAg
ICAgIH07Cj4+ICB9Owo+PiAKPj4gK3VuaW9uIHZpcmlkaWFuX3N0aW1lcl9jb25maWdfbXNyCj4+
ICt7Cj4+ICsgICAgdWludDY0X3QgcmF3Owo+PiArICAgIHN0cnVjdAo+PiArICAgIHsKPj4gKyAg
ICAgICAgdWludDY0X3QgZW5hYmxlZDoxOwo+PiArICAgICAgICB1aW50NjRfdCBwZXJpb2RpYzox
Owo+PiArICAgICAgICB1aW50NjRfdCBsYXp5OjE7Cj4+ICsgICAgICAgIHVpbnQ2NF90IGF1dG9f
ZW5hYmxlOjE7Cj4+ICsgICAgICAgIHVpbnQ2NF90IHZlY3Rvcjo4Owo+PiArICAgICAgICB1aW50
NjRfdCBkaXJlY3RfbW9kZToxOwo+PiArICAgICAgICB1aW50NjRfdCByZXNlcnZlZF96ZXJvMToz
Owo+PiArICAgICAgICB1aW50NjRfdCBzaW50eDo0Owo+PiArICAgICAgICB1aW50NjRfdCByZXNl
cnZlZF96ZXJvMjo0NDsKPj4gKyAgICB9IGZpZWxkczsKPiAKPiBMb29rcyBsaWtlIEkgbWlzc2Vk
IHRoaXMuIEknbGwgc2VuZCBhIHY2IHdpdGggaXQgcmVtb3ZlZC4KCk9oLCBhbmQgSSBkaWRuJ3Qg
cmVhbGx5IG5vdGljZS4KCkJ1dCB0aGUgcmVhbCByZWFzb24gZm9yIG15IHJlcGx5OiBQbGVhc2Ug
dHJpbSB0aGUgcXVvdGluZyBpbiB5b3VyCnJlcGxpZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
