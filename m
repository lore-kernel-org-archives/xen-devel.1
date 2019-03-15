From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/2] xen/debug: make debugtrace more
 clever regarding repeating entries
Date: Fri, 15 Mar 2019 13:29:14 +0000
Message-ID: <20190315132914.p3h7b7rvv6jcrw2b@zion.uk.xensource.com>
References: <20190315063557.24814-1-jgross@suse.com>
 <20190315063557.24814-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1zYA=RS=citrix.com=prvs=9700dc273=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h4mtl-0007aQ-Pn
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 13:29:21 +0000
Content-Disposition: inline
In-Reply-To: <20190315063557.24814-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDc6MzU6NTdBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBJbiBjYXNlIGRlYnVndHJhY2UgaXMgd3JpdGluZyB0byBtZW1vcnkgYW5kIHRoZSBs
YXN0IGVudHJ5IGlzIHJlcGVhdGVkCj4gZG9uJ3QgZmlsbCB1cCB0aGUgdHJhY2UgYnVmZmVyLCBi
dXQgbW9kaWZ5IHRoZSBjb3VudCBwcmVmaXggdG8gIngteSAiCj4gc3R5bGUgaW5zdGVhZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
