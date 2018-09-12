From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 12 Sep 2018 07:39:02 -0600
Message-ID: <5B9916F602000078001E7DA4@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-9-paul.durrant@citrix.com>
 <5B925CC402000078001E6538@prv1-mh.provo.novell.com>
 <f341403b1c684f6a82ec85905599178e@AMSPEX02CL03.citrite.net>
 <5B98D1B702000078001E7A8F@prv1-mh.provo.novell.com>
 <77f7af1c0daf48c9ab66bbd77cc022ec@AMSPEX02CL03.citrite.net>
 <2c79d7d0775c4cbe8dc7577ab6b08e74@AMSPEX02CL03.citrite.net>
 <22882dd60fc847728f96b2d4b9c0a9d3@AMSPEX02CL03.citrite.net>
 <5B98D65E02000078001E7ACF@prv1-mh.provo.novell.com>
 <7ad76f0c35584cf08adcffaf1fe5bba4@AMSPEX02CL03.citrite.net>
 <5B98D89A02000078001E7B14@prv1-mh.provo.novell.com>
 <82baab81955d48ae9a2c50b964c2ca34@AMSPEX02CL03.citrite.net>
 <5B98DA8902000078001E7B4E@prv1-mh.provo.novell.com>
 <a1a3bec472394b4f9ec2cf6ee4f557d2@AMSPEX02CL03.citrite.net>
 <5B98E57B02000078001E7BCB@prv1-mh.provo.novell.com>
 <c7c8d9c024f548f7a93bb38910f44c51@AMSPEX02CL03.citrite.net>
 <5B99035C02000078001E7D33@prv1-mh.provo.novell.com>
 <6c3c81cf011944c595df1376f5d1607a@AMSPEX02CL03.citrite.net>
 <5B9908F002000078001E7D59@prv1-mh.provo.novell.com>
 <5eab03ec84ef45b48a31a2efa939ab16@AMSPEX02CL03.citrite.net>
 <5B99127102000078001E7D89@prv1-mh.provo.novell.com>
 <dd6ddc933dc44bf6a30f07948b90a477@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g05ML-0000g5-NH
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 13:39:09 +0000
In-Reply-To: <dd6ddc933dc44bf6a30f07948b90a477@AMSPEX02CL03.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDE1OjI1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTIgU2VwdGVtYmVyIDIwMTggMTQ6MjAK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuCj4+IDxrZXZp
bi50aWFuQGludGVsLmNvbT47IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPgo+PiBTdWJqZWN0OiBSRTogW1BBVENIIHY2IDA4LzE0XSB2dGQ6IGFkZCBsb29rdXBfcGFn
ZSBtZXRob2QgdG8gaW9tbXVfb3BzCj4+IAo+PiA+Pj4gT24gMTIuMDkuMTggYXQgMTQ6NTMsIDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gVGhlIGZ1bmN0aW9uIHdpbGwgbmV2
ZXIgcmV0dXJuIGl0cyByZXN1bHRzIHRvIGEgZ3Vlc3QsIFBWIG9yIEhWTSwgc28gSQo+PiA+IHJl
YWxseSBkb24ndCBzZWUgdGhlIGNvbmNlcm4uIEl0J3MgYSBsb3cgbGV2ZWwgZnVuY3Rpb24sIGZv
ciBYZW4ncyBpbnRlcm5hbAo+PiA+IHVzZSBvbmx5LiBJdCdzIGVzc2VudGlhbGx5IHRoZSBlcXVp
dmFsZW50IG9mIGEgcDJtIGxvb2t1cCBmdW5jdGlvbiBhbmQKPj4gPiB0aGVyZSdzIG5vIHdheSB3
ZSdkIGV2ZXIgZXhwb3NlIHRoZSByZXN1bHRzIG9mIHN1Y2ggYSBsb29rdXAgdG8gdGhlIGd1ZXN0
Cj4+ID4gZWl0aGVyLgo+PiAKPj4gT2gsIHRoYXQgd2FzIHV0dGVyIGNvbmZ1c2lvbiBvbiBteSBw
YXJ0IHRoZW4sIGFuZCBJJ20gc29ycnkgZm9yIGFsbAo+PiB0aGUgbm9pc2UuIEkndmUgZ290IG1p
c2xlYWQgYnkgdGhlIHRpdGxlcyBvZiB0aGlzIHBhdGNoIGFuZCBwYXRjaGVzCj4+IDEzIGFuZCAx
NCwgYWxsIG9mIHdoaWNoIGhhdmUgImlvbW11X29wcyIgYXMgcGFydHMgb2YgdGhlbS4KPj4gCj4g
Cj4gSSByZWNlbnRseSBub3RpY2VkIHRoaXMgbmFtZSBvdmVybG9hZGluZyBzbyBzb3JyeSBmb3Ig
bGVhZGluZyB5b3UgYXN0cmF5LiBJIAo+IHdpbGwgc2VyaW91c2x5IGNvbnNpZGVyIHJlbmFtaW5n
IHRoZSBoeXBlcmNhbGwgd2hlbiBJIHJlLXdvcmsgdGhlIGxhdGVyIAo+IHBhdGNoZXMuCgpUaGUg
aHlwZXJjYWxsIG5hbWUgaXMgZmluZSwgSSB0aGluay4gUGVyaGFwcyB0aGUgZGlzdGluY3Rpb24K
Y291bGQgYWxyZWFkeSBiZSBtYWRlIG1vcmUgY2xlYXIgYnkgdXNpbmcgaW9tbXVfb3BzIGZvciB0
aGUKaW50ZXJuYWwgaW50ZXJmYWNlKHMpIChtYXRjaGluZyB0aGVpciBzdHJ1Y3R1cmUgbmFtZSkg
YW5kCmlvbW11X29wIC8gaW9tbXVfb3AtcyBmb3IgdGhlIGh5cGVyY2FsbCBiYXNlZCBvcGVyYXRp
b25zLApzZWVpbmcgdGhhdCB0aGUgc3RydWN0dXJlIGlzIG5hbWVzIHhlbl9pb21tdV9vcD8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
