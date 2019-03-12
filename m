From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] SVM: fix build after "make nested
 page-fault tracing and logging consistent"
Date: Tue, 12 Mar 2019 11:45:27 -0400
Message-ID: <6cd7dfdd-3d59-837d-b970-c67c2caefc62@oracle.com>
References: <5C87CF3D020000780021DD02@prv1-mh.provo.novell.com>
 <20190312154319.f2tyv67maar23qv4@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Jsx=RP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h3jbD-0006kg-22
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 15:45:51 +0000
In-Reply-To: <20190312154319.f2tyv67maar23qv4@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMi8xOSAxMTo0MyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIE1hciAxMiwgMjAx
OSBhdCAwOToyNDo0NUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gU29tZSBjb21waWxl
ciB2ZXJzaW9ucyBkb24ndCByZWNvZ25pemUgdGhhdCAibWZuIiBjYW4ndCByZWFsbHkgYmUgdXNl
ZAo+PiB1bmluaXRpYWxpemVkIGluIHN2bV9kb19uZXN0ZWRfcGdmYXVsdCgpLiBUbyBiZSBvbiB0
aGUgc2FmZSBzaWRlLCBhZGQgYW4KPj4gaW5pdGlhbGl6ZXIgZm9yIHAybXQgYXMgd2VsbC4KPj4K
Pj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZp
ZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
