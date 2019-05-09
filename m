From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 06/14] xen: Convert hotplug page function to
 use typesafe MFN
Date: Thu, 9 May 2019 19:10:45 +0100
Message-ID: <b1f7d744-060c-73bb-e08b-990566b06c57@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091057200.25766@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOnVL-0006zf-Hv
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:10:51 +0000
In-Reply-To: <alpine.DEB.2.21.1905091057200.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDUvOS8xOSA3OjAxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gVHVlLCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENvbnZlcnQgb25s
aW5lX3BhZ2UsIG9mZmxpbmVfcGFnZSBhbmQgcXVlcnlfcGFnZV9vZmZsaW5lIHRvIHVzZQo+PiB0
eXBlc2FmZSBNRk4uCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGhhdmUgYSBzdGF0ZW1lbnQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlIG1lbnRpb25pbmcgdGhlCj4gY2hhbmdlcyBiZWxvdyB0byBtY2lfYWN0
aW9uX2FkZF9wYWdlb2ZmbGluZSBhbmQgbWNfbWVtZXJyX2RoYW5kbGVyLgoKSSB3b3VsZCBwcmVm
ZXIgdGhlIGdlbmVyaWMgd29yZGluZzoKCiJBdCB0aGUgc2FtZSB0aW1lLCB0aGUgdHlwZXNhZmUg
aXMgcHJvcGFnYXRlZCBhcyBmYXIgYXMgcG9zc2libGUgd2l0aG91dAptYWpvciBtb2RpZmljYXRp
b25zLiIKCj4gCj4gIEZyb20gYW4gQVJNIHBvaW50IG9mIHZpZXcsIGl0IGlzIGZpbmUuCgpUaGFu
ayB5b3UhCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
