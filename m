From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 00/45] xen: add core scheduling
 support
Date: Mon, 6 May 2019 09:10:36 +0200
Message-ID: <d3a07570-4124-a36f-9f8b-b4f664bdc48f@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXlo-000060-Gt
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 07:10:40 +0000
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAwODo1NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgc3VwcG9ydCBm
b3IgY29yZS0gYW5kIHNvY2tldC1zY2hlZHVsaW5nIGluIHRoZSBYZW4gaHlwZXJ2aXNvci4KClRo
ZSBzZXJpZXMgaXMgYXZhaWxhYmxlIHVuZGVyOgoKICBnaXRodWIuY29tL2pncm9zczEveGVuLmdp
dCBzY2hlZC1yZmMtdjIKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
