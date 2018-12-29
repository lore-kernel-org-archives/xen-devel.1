From: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Date: Fri, 28 Dec 2018 21:25:04 -0800
Message-ID: <20181229052504.GA16315__14543.9353226267$1546065549$gmane$org@magnolia>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
 <alpine.DEB.2.21.1812232304130.2940@hadrien>
 <CAKR_QVLeZBL43W4x1mzcfcakSZyyh9L81vgUMxfnSccKawEfdg@mail.gmail.com>
 <20181227134055.GA2272@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=24J1=PG=oracle.com=darrick.wong@srs-us1.protection.inumbo.net>)
 id 1gd77y-0006pr-PD
 for xen-devel@lists.xenproject.org; Sat, 29 Dec 2018 05:25:38 +0000
Content-Disposition: inline
In-Reply-To: <20181227134055.GA2272@kadam>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tom Psyborg <pozega.tomislav@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjcsIDIwMTggYXQgMDQ6NDA6NTVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBUdWUsIERlYyAyNSwgMjAxOCBhdCAxMToxMjoyMFBNICswMTAwLCBUb20gUHN5
Ym9yZyB3cm90ZToKPiA+IHRoZXJlIHdhcyBkaXNjdXNzaW9uIGFib3V0IHRoaXMganVzdCBzb21l
IGRheXMgYWdvLiBDQyA0LTUgbGlzdHMgaXMKPiA+IG1vcmUgdGhhbiBlbm91Z2gKPiA+IAo+IAo+
IEkgZG9uJ3Qga25vdyB3aG8geW91IHdlcmUgZGlzY3Vzc2luZyB0aGlzIHdpdGguLi4KPiAKPiBZ
b3Ugc2hvdWxkIENDIHRoZSAwdGggcGF0Y2ggdG8gYWxsIHRoZSBtYWlsaW5nbGlzdHMuICBUaGF0
IG11Y2ggaXMgYQo+IGNsZWFyIHJ1bGUuCj4gCj4gRm9yIHRoZSByZXN0LCBKdWxpYSdzIHBvc2l0
aW9uIGlzIHRoZSBtb3JlIGNvbnNlcnZhdGl2ZSBvbmUuICBJIHdhcyBpbgo+IGEgY29udmVyc2F0
aW9uIGluIFJMIGFuZCB0aGV5IHdlcmUgbGlrZSwgIkNDIGV2ZXJ5b25lIGZvciBhbGwgdGhlCj4g
cGF0Y2hlcyIuICBJdCBkZXBlbmRzIG9uIHRoZSBjb250ZXh0LCBvZiBjb3Vyc2UuICBJZiB0aGUg
cGF0Y2hlcyBhcmUKPiBkZXBlbmRlbnQgb24gZWFjaCBvdGhlciB0aGVuIHlvdSAqaGF2ZSogdG8g
Q0MgZXZlcnlvbmUgZm9yIGV2ZXJ5dGhpbmcuCgpBZ3JlZWQuICBNcy4gTGF3YWxsLCBzZW5kaW5n
ICJDb3ZlciBsZXR0ZXIgKyBhbGwgcmVsZXZhbnQgWEZTIHBhdGNoZXMiCihhcyB5b3UgZGlkKSB3
YXMgZXhhY3RseSB0aGUgcmlnaHQgdGhpbmcgZm9yIHVzIHhmcyB0eXBlcy4gOikKCkZvciB0aGF0
IG1hdHRlciwgd2UgcHJlZmVyIHRvIHJlY2VpdmUgdGhyb3VnaCBsaW51eC14ZnMgbW9yZSBwYXRj
aGVzCnRoYW4gbmVjZXNzYXJ5IChvbmUgY2FuIHNlbmQgdGhlIGVudGlyZSBzZXJpZXMgaWYgb25l
IGlzIHVuc3VyZSkgdGhhbiB0bwpnbyB3YW50aW5nIGZvciBtb3JlIGNvbnRleHQuCgotLUQKCj4g
SWYgd2UgcmVhbGx5IGhhdmUgb3RoZXIgY2xlYXIgcnVsZXMsIHRoZW4gaXQgc2hvdWxkIGJlIGVu
Y29kZWQgaW50bwo+IGdldF9tYWludGFpbmVyLnBsIHNvIHRoYXQgaXQncyBhdXRvbWF0aWMuCj4g
Cj4gTXkgb3RoZXIgcXVlc3Rpb24gaXMgd2h5IGRvIHRoZSBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBwZW9wbGUgZmVlbCBsaWtlIHRoZXkgbmVlZCB0byBiZSBDQydkIGFi
b3V0IGV2ZXJ5IGRyaXZlcj8/PyAgSSBhbHdheXMKPiByZW1vdmUgdGhlbSBmcm9tIHRoZSBDQyBs
aXN0IHVubGVzcyBpdCdzIGFuIGFyY2gvYXJtIGlzc3VlLgo+IAo+IHJlZ2FyZHMsCj4gZGFuIGNh
cnBlbnRlcgo+IAo+IFBTOiAgUGxlYXNlLCBubyBtb3JlIHRvcCBwb3N0aW5nLgo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
