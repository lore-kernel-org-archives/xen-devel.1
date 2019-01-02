From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC v2 13/16] hack: arm/domain: simplify context
 restore from idle vcpu
Date: Wed, 2 Jan 2019 12:24:12 +0000
Message-ID: <20190102122412.pl7pdjexvbr5qhiv@zion.uk.xensource.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
 <1545823227-6207-14-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gefZv-0006LI-Qu
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 12:24:55 +0000
Content-Disposition: inline
In-Reply-To: <1545823227-6207-14-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMjYsIDIwMTggYXQgMDE6MjA6MjRQTSArMDIwMCwgQW5kcmlpIEFuaXNvdiB3
cm90ZToKPiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+
IFNpbXBsaWZ5IGNvbnRleHQgcmVzdG9yZSBmcm9tIGlkbGUgdmNwdSB0byB0aGUgb25lIHJhbiBi
ZWZvcmUgaXQuCj4gVGhpcyBpbXByb3ZlcyBsb3cgY3B1IGxvYWQgYnV0IGhpZ2ggaXJxIHJhdGUg
dXNlLWNhc2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+CgpDYW4gdGhpcyBiZSBwdXQgdW5kZXIgYXJjaF92Y3B1IGluc3RlYWQ/IEl0
IGhhcyBubyB1c2UgaW4geDg2IGNvZGUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
