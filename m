From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 14:46:46 +0100
Message-ID: <6061af99-0c27-e02b-e185-fe1dfca1a96a@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=osxn=gk=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1eyHbX-0001sb-MR
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:47:07 +0000
In-Reply-To: <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>, "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAuMDMuMjAxOCAxNDozMiwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiAgIEhpLAo+IAo+Pj4g
U28gZm9yIHRoZXNlLCB3ZSBzaG91bGQgdXNlICIiLiAgTm9uZSBvZiB0aGVzZSBhcmUgZ2VuZXJh
dGVkIGZpbGVzIHRob3VnaC4KPj4KPj4gVGhhdCBsZWFkcyB0byBjcmF6eSBpbmNvbnNpc3RlbnQg
bWVzc2FnZSBmb3IgZGV2ZWxvcGVycyB3aGVyZSA1MCUgb2YgUUVNVQo+PiBoZWFkZXIgZmlsZXMg
bXVzdCB1c2UgPD4gYW5kIHRoZSBvdGhlciA1MCUgb2YgaGVhZGVyIGZpbGVzIG11c3QgdXNlICIi
Lgo+IAo+IFRoZSBydWxlcyBhcmUgcHJldHR5IHNpbXBsZSB0aG91Z2g6Cj4gCj4gICAgKDEpIEhl
YWRlcnMgd2hpY2ggYXJlIGdlbmVyYXRlZCB1c2UgPD4uCj4gICAgKDIpIEhlYWRlcnMgd2hpY2gg
YXJlIGluIGluY2x1ZGUvIHVzZSA8Pi4KPiAgICAoMykgSGVhZGVycyBzaXR0aW5nIGluIHRoZSBz
YW1lIGRpcmVjdG9yeSBhcyB0aGUgc291cmNlIGZpbGVzIHVzZSAiIi4KClVnaCwgbm8uIFBsZWFz
ZSBkb24ndC4gVGhlIG5vcm1hbCB3YXkgb2YgaW5jbHVkaW5nIGhlYWRlciBmaWxlcyBpbiBRRU1V
CmlzIHRvIHVzZSAiIiAtIGFsc28gZm9yIGhlYWRlcnMgdGhhdCBhcmUgbm90IGluIHRoZSBzYW1l
IGRpcmVjdG9yeS4gRm9yCmV4YW1wbGUganVzdCBkbyBhCgogZ3JlcCAtciAnXiNpbmNsdWRlLipo
dy8nIGh3LwoKZnJvbSB0aGUgdG9wIGRpcmVjdG9yeSBhbmQgeW91J2xsIHNlZSB3aGF0IEkgbWVh
bi4gQ2hhbmdpbmcgdGhhdCBydWxlIGlzCmNyYXp5LiBTbyBwbGVhc2UsIGxldCdzIGp1c3QgZml4
IHRoZSBjb25maWd1cmUgc2NyaXB0IHRvIGRldGVjdCBzb21lCm1vcmUgc3RhbGUgZmlsZXMgaW4g
dGhlIHNvdXJjZSB0cmVlLCBhbmQgd2UncmUgZG9uZS4KCiBUaG9tYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
