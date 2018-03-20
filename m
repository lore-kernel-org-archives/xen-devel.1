From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 13:41:17 +0000
Message-ID: <20180320134117.GS4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iii=gk=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eyHWf-0001fZ-Aw
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:42:05 +0000
Content-Disposition: inline
In-Reply-To: <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDI6MzI6MTZQTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gPiBTbyBmb3IgdGhlc2UsIHdlIHNob3VsZCB1c2UgIiIuICBO
b25lIG9mIHRoZXNlIGFyZSBnZW5lcmF0ZWQgZmlsZXMgdGhvdWdoLgo+ID4gCj4gPiBUaGF0IGxl
YWRzIHRvIGNyYXp5IGluY29uc2lzdGVudCBtZXNzYWdlIGZvciBkZXZlbG9wZXJzIHdoZXJlIDUw
JSBvZiBRRU1VCj4gPiBoZWFkZXIgZmlsZXMgbXVzdCB1c2UgPD4gYW5kIHRoZSBvdGhlciA1MCUg
b2YgaGVhZGVyIGZpbGVzIG11c3QgdXNlICIiLgo+IAo+IFRoZSBydWxlcyBhcmUgcHJldHR5IHNp
bXBsZSB0aG91Z2g6Cj4gCj4gICAgKDEpIEhlYWRlcnMgd2hpY2ggYXJlIGdlbmVyYXRlZCB1c2Ug
PD4uCj4gICAgKDIpIEhlYWRlcnMgd2hpY2ggYXJlIGluIGluY2x1ZGUvIHVzZSA8Pi4KPiAgICAo
MykgSGVhZGVycyBzaXR0aW5nIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGUgc291cmNlIGZp
bGVzIHVzZSAiIi4KCldlIGhhdmUgMTIwMCBoZWFkZXIgZmlsZXMgaW4gUUVNVSAtIGEgZGV2ZWxv
cGVyIG1pZ2h0IGp1c3QgcmVhc29uYWJseSByZW1lbWJlcgp3aGljaCBoZWFkZXIgZmlsZSBpcyBh
IFFFTVUgaGVhZGVyLCB2cyB3aGljaCBpcyBhIDNyZCBwYXJ0eSBzeXN0ZW0gaGVhZGVyLgpFeHBl
Y3RpbmcgZGV2cyB0byByZW1lbWJlciB3aGljaCBvZiB0aG9zZSAzIGJ1Y2tldHMgZWFjaCBRRU1V
IGhlYWRlciBmYWxscwp1bmRlciBpcyB1bnJlYXNvbmFibGUgSU1ITy4gCgpSZWdhcmRzLApEYW5p
ZWwKLS0gCnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZs
aWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAg
ICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwKfDogaHR0
cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5j
b20vZGJlcnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
