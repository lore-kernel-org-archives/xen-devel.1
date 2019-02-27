From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] drm: add func to better detect wether
 swiotlb is needed
Date: Wed, 27 Feb 2019 14:25:50 -0500
Message-ID: <20190227192550.GB24946__32453.0368250393$1551295648$gmane$org@char.us.oracle.com>
References: <1550617692-27306-1-git-send-email-michael.d.labriola@gmail.com>
 <ba6812cbb26341bd9b5d3a0981f7d64b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <ba6812cbb26341bd9b5d3a0981f7d64b@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Chunming Zhou <david1.zhou@amd.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Michael D Labriola' <michael.d.labriola@gmail.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Christoph Hellwig <hch@infradead.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Jan Beulich <JBeulich@suse.com>, Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, Monk Liu <monk.liu@amd.com>
List-Id: xen-devel@lists.xenproject.org

LnNuaXAuLgo+ID4gLXU2NCBkcm1fZ2V0X21heF9pb21lbSh2b2lkKQo+ID4gK2Jvb2wgZHJtX25l
ZWRfc3dpb3RsYihpbnQgZG1hX2JpdHMpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnRt
cDsKPiA+ICAJcmVzb3VyY2Vfc2l6ZV90IG1heF9pb21lbSA9IDA7Cj4gPiAKPiA+ICsJLyoKPiA+
ICsJICogWGVuIHBhcmF2aXJ0dWFsIGhvc3RzIHJlcXVpcmUgc3dpb3RsYiByZWdhcmRsZXNzIG9m
IHJlcXVlc3RlZCBkbWEKPiA+ICsJICogdHJhbnNmZXIgc2l6ZS4KPiA+ICsJICoKPiA+ICsJICog
Tk9URTogUmVhbGx5LCB3aGF0IGl0IHJlcXVpcmVzIGlzIHVzZSBvZiB0aGUgZG1hX2FsbG9jX2Nv
aGVyZW50Cj4gPiArCSAqICAgICAgIGFsbG9jYXRvciB1c2VkIGluIHR0bV9kbWFfcG9wdWxhdGUo
KSBpbnN0ZWFkIG9mCj4gPiArCSAqICAgICAgIHR0bV9wb3B1bGF0ZV9hbmRfbWFwX3BhZ2VzKCks
IHdoaWNoIGJvdW5jZSBidWZmZXJzIHNvIG11Y2gKPiA+IGluCj4gPiArCSAqICAgICAgIFhlbiBp
dCBsZWFkcyB0byBzd2lvdGxiIGJ1ZmZlciBleGhhdXN0aW9uLgo+ID4gKwkgKi8KPiA+ICsJaWYg
KHhlbl9wdl9kb21haW4oKSkKPiAKPiBJJ3ZlIG5vdCBiZWVuIGZvbGxvd2luZyBhbGwgb2YgdGhl
IGlucyBhbmQgb3V0cyBvZiB0aGUgZGlzY3Vzc2lvbiBvbiB0aGlzIHNvIGFwb2xvZ2llcyBpZiBJ
J20gbWlzc2luZyBzb21lIGNvbnRleHQsIGJ1dC4uLgo+IAo+IFRoaXMgbG9va3MgbGlrZSB0aGUg
d3JvbmcgdGVzdCB0byBtZS4gSSB0aGluayBpdCBzaG91bGQgYmU6Cj4gCj4gaWYgKCB4ZW5fc3dp
b3RsYiApCgpBaCwgdGhhdCBjb3VsZCBiZSBhcyB3ZWxsLiAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
