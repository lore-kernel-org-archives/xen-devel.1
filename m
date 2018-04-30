From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Mon, 30 Apr 2018 16:02:48 +0000
Message-ID: <96ED0EFF-C77D-4946-97FE-31731D9DE2AB@citrix.com>
References: <cover.1525005313.git.lars.kurth@citrix.com>
 <1935c3cc282228c806081ab47653215ca0080a3c.1525005313.git.lars.kurth@citrix.com>
 <23271.10702.618476.183954@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3ogq=ht=citrix.com=prvs=651ac8646=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fDBGv-0001mo-7y
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 16:03:25 +0000
In-Reply-To: <23271.10702.618476.183954@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <76BA56DEA5331C4D94368F5FB5E26923@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQrvu79PbiAzMC8wNC8yMDE4LCAxNTozNiwgIklhbiBKYWNrc29uIiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4gd3JvdGU6DQoNCiAgICA+ICtpZiAoISAtZSAkZ2V0X21haW50YWluZXIpIHsNCiAg
ICA+ICsgICAgZGllICIkdG9vbDogVGhlIHRvb2wgcmVxdWlyZXMgJGdldF9tYWludGFpbmVyXG4i
Ow0KICAgID4gK30NCiAgICANCiAgICBZb3UgbWF5IHJlbWVtYmVyIG1lIHNheWluZyBJIHdhbnRl
ZCBhIG1vZGUgdGhhdCBzaW1wbHkgdHJhbnNmZXJzDQogICAgbWFpbnRhaW5lciBpbmZvcm1hdGlv
biBhbHJlYWR5IHByb3ZpZGVkIGluIHRoZSBwYXRjaGVzLiAgVGhhdCBpcw0KICAgIHVzZWZ1bCB3
aGVuIHRoZSBDQ3MgaGF2ZSBiZWVuIG1hbnVhbGx5IHNwZWNpZmllZC4NCiAgICANCiAgICBJIGRv
bid0IHRoaW5rIHN1Y2ggYSBtb2RlIGlzIGVzc2VudGlhbCBmb3IgbWUgdG8gYWNrIHRoaXMgcGF0
Y2guDQoNCkkgdGhpbmsgSSBtYXkgaGF2ZSBtaXN1bmRlcnN0b29kIHlvdS4NCg0KR2l2ZW4gdGhh
dCBnaXQgc2VuZC1lbWFpbCByZWFkcyBDQydzIGFueXdoZXJlIGluIHRoZSBib2R5IG9mIGEgKi5w
YXRjaCBmaWxlLCANCkkgYW0gbm90IHN1cmUgd2h5IHRoaXMgaXMgdXNlZnVsLiBDYW4geW91IGVu
bGlnaHRlbiBtZT8gSXQgZG9lcyBhbHNvIGhhdmUgYWxsIA0KdGhlIGJpdHMgdG8gZW5zdXJlIHRo
YXQgSSBjYW4gZG8gdGhpcy4gQWthIEkgY2FuIG1ha2Ugc3VyZSB0aGF0IGFsbCB0aGUgQ0MncyBm
cm9tIA0KdGhlIGNvbW1pdC1tZXNzYWdlLyoucGF0Y2ggZmlsZXMgYXJlIGFkZGVkIHRvIHRoZSBl
LW1haWwgYmxvY2suIFJpZ2h0IG5vdw0KSSBhdm9pZCBkdXBsaWNhdGlvbjogYWthIEkgb25seSBh
ZGQgc3R1ZmYgdG8gdGhlIGhlYWRlciBpZiBpdCBpcyBub3QgYWxyZWFkeSANCkluIHRoZSBjb21t
aXQtbWVzc2FnZS8qLnBhdGNoLiAgDQoNCkkgY2FuIHNlZSB0aG91Z2gsIHRoYXQgc29tZSBvZiB0
aGUgdG9vbCBmdW5jdGlvbmFsaXR5IGlzIHVzZWZ1bCBpbiBub24teGVuIA0KdHJlZXMuIFRodXMs
IGNoYW5naW5nIGl0IHN1Y2ggdGhhdCBpdCBkb2Vzbid0IGZhbGwgb3ZlciB3aGVuIGdldF9tYWlu
dGFpbmVycy5wbCANCmlzbid0IHRoZXJlIGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhLg0KDQpMYXJz
ICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
