From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 04/18] xen/arm: While a domain is suspended
 put its watchdogs on pause
Date: Mon, 12 Nov 2018 04:47:20 -0700
Message-ID: <5BE9684802000078001FADC0@prv1-mh.provo.novell.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-5-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542022244-22977-5-git-send-email-mirela.simonovic@aggios.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mirela.simonovic@aggios.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDEyOjMwLCA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3
cm90ZToKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdGltZXIuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi90aW1lci5oCj4gQEAgLTE4LDYgKzE4LDkgQEAgc3RydWN0IHRpbWVyIHsKPiAgICAgIC8q
IFN5c3RlbSB0aW1lIGV4cGlyeSB2YWx1ZSAobmFub3NlY29uZHMgc2luY2UgYm9vdCkuICovCj4g
ICAgICBzX3RpbWVfdCBleHBpcmVzOwo+ICAKPiArICAgIC8qIFN1c3BlbmQgdGltZXN0YW1wIHZh
bHVlIChuYW5vc2Vjb25kcyBzaW5jZSBib290KS4gKi8KPiArICAgIHNfdGltZV90IHN1c3BlbmRl
ZDsKCkkgY2FuJ3Qgc2VlIGhvdyB0aGlzIGJlY29tZXMgYSB1bml2ZXJzYWxseSB1c2VmdWwgZmll
bGQsIHNvIEkKZG9uJ3QgdGhpbmsgaXQgYmVsb25ncyBoZXJlLiBGb3IgeW91ciBwdXJwb3NlIGRl
cml2aW5nIGEgbmV3CnN0cnVjdHVyZSBjb250YWluaW5nIHN0cnVjdCB0aW1lciBhbmQgdGhpcyBv
bmUgZmllbGQgc2hvdWxkCndvcmsuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
