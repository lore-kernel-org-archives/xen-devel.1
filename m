From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 12 Sep 2018 07:19:45 -0600
Message-ID: <5B99127102000078001E7D89@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g053e-0007Xb-Ot
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 13:19:50 +0000
In-Reply-To: <5eab03ec84ef45b48a31a2efa939ab16@AMSPEX02CL03.citrite.net>
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

Pj4+IE9uIDEyLjA5LjE4IGF0IDE0OjUzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBmdW5jdGlvbiB3aWxsIG5ldmVyIHJldHVybiBpdHMgcmVzdWx0cyB0byBhIGd1ZXN0
LCBQViBvciBIVk0sIHNvIEkgCj4gcmVhbGx5IGRvbid0IHNlZSB0aGUgY29uY2Vybi4gSXQncyBh
IGxvdyBsZXZlbCBmdW5jdGlvbiwgZm9yIFhlbidzIGludGVybmFsIAo+IHVzZSBvbmx5LiBJdCdz
IGVzc2VudGlhbGx5IHRoZSBlcXVpdmFsZW50IG9mIGEgcDJtIGxvb2t1cCBmdW5jdGlvbiBhbmQg
Cj4gdGhlcmUncyBubyB3YXkgd2UnZCBldmVyIGV4cG9zZSB0aGUgcmVzdWx0cyBvZiBzdWNoIGEg
bG9va3VwIHRvIHRoZSBndWVzdCAKPiBlaXRoZXIuCgpPaCwgdGhhdCB3YXMgdXR0ZXIgY29uZnVz
aW9uIG9uIG15IHBhcnQgdGhlbiwgYW5kIEknbSBzb3JyeSBmb3IgYWxsCnRoZSBub2lzZS4gSSd2
ZSBnb3QgbWlzbGVhZCBieSB0aGUgdGl0bGVzIG9mIHRoaXMgcGF0Y2ggYW5kIHBhdGNoZXMKMTMg
YW5kIDE0LCBhbGwgb2Ygd2hpY2ggaGF2ZSAiaW9tbXVfb3BzIiBhcyBwYXJ0cyBvZiB0aGVtLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
