From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 16:02:42 +0200
Message-ID: <20180320160208-mutt-send-email-mst@kernel.org>
References: <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
 <20180320134117.GS4530@redhat.com>
 <20180320154703-mutt-send-email-mst@kernel.org>
 <20180320135832.GT4530@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyHr3-000456-S8
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 14:03:09 +0000
Content-Disposition: inline
In-Reply-To: <20180320135832.GT4530@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDE6NTg6MzJQTSArMDAwMCwgRGFuaWVsIFAuIEJlcnJh
bmfDqSB3cm90ZToKPiA+IFRoYXQncyB0aGUgQyBsYW5ndWFnZSBmb3IgeW91IHRob3VnaC4gIEZv
ciBiZXR0ZXIgb3Igd29yc2UsIHRoZXNlIGFyZQo+ID4gdGhlIHJ1bGVzIHRoYXQgSyZSIGNhbWUg
dXAgd2l0aC4KPiAKPiBObyBvbmUgc2VyaW91c2x5IHRyaWVzIHRvIGtlZXAgY29tcGxpYW5jZSB3
aXRoIG9yaWdpbmFsIEsmUiBDIHRoZXNlIGRheXMsCj4gdGhpbmdzIGhhdmUgbW92ZWQgb24gbWFz
c2l2ZWx5IHNpbmNlIHRoZW4uCgpOb3Qgd2hlcmUgdGhlIHByZXByb2Nlc3NvciBpcyBpbnZvbHZl
ZC4KCj4gUmVnYXJkcywKPiBEYW5pZWwKPiAtLSAKPiB8OiBodHRwczovL2JlcnJhbmdlLmNvbSAg
ICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKPiB8
OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3Rv
cDEzOC5iZXJyYW5nZS5jb20gOnwKPiB8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAt
by0gICAgaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
