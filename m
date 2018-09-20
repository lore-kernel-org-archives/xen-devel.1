From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Thu, 20 Sep 2018 17:06:29 +0100
Message-ID: <20180920160629.jullgb435zi7bcbr@zion.uk.xensource.com>
References: <20180918060309.7186=3def=3dbf=3dbd1=3def=3dbf=3dbdjgr?==?UTF-8?Q?oss@suse.com=3f=3d>
 <5BA0D44602000078001E93EA@prv1=ef=bf=bdmh.pro?==?UTF-8?Q?vo.novell.com>
 <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
 <5?==?UTF-8?Q?BA0DF9602000078001=3d=3fUTF-8=3fQ=3fE9448@suse.com>
 <6d56ad90-782?==?UTF-8?Q?5-adb7-f4e5-6c3ceb3210f6@suse.com>
 <001ab73a-078d-4ec1-4acd-2fb43?==?UTF-8?Q?89e8867@citrix.com>
 <20180919172818.3aksiju4s3ipw42p@zion.uk.xens?==?UTF-8?Q?ource.com>
 <fffd7e59-e437-8ed9-b228-b537fde050cd@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1x7a=mc=citrix.com=prvs=794768bfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g31k4-0000hg-Lu
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 16:23:48 +0000
Content-Disposition: inline
In-Reply-To: <fffd7e59-e437-8ed9-b228-b537fde050cd@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDc6NTg6NTBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiAKPiBEaWQgeW91IGxvb2sgaW50byB0aGUgcGF0Y2hlcywgZXNwZWNpYWxseSBwYXRj
aCAxMD8gVGhlIHBhcmFtZXRlcnMgc2V0Cj4gYXJlIGFsbCBzdG9yZWQgaW4gZG9tYWluIGNvbmZp
ZyB2aWEgbGlieGxfX2FyY2hfZG9tYWluX3NhdmVfY29uZmlnKCkuCgpObywgSSBkaWRuJ3QuCgpJ
IHRoaW5rIHRoZSBnZW5lcmFsIGlkZWEgb2Ygd2hhdCB5b3UgZG8gaW4gcGF0Y2ggMTAgc2hvdWxk
IHdvcmsuIEhvd2V2ZXIKSSB3YW50IHRvIGNvbW1lbnQgb24gdGhlIGltcGxlbWVudGF0aW9uLgoK
SXQgYXBwZWFycyB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBwYXRjaCAxMCBjb25jYXRlbmF0
ZXMgdGhlIG5ldwpzZXR0aW5ncyB0byB0aGUgb2xkIG9uZXMuIEl0IGlzIG5vdCB2ZXJ5IG5pY2Ug
aW1vLgoKSWYgZm9yIHRoZSBsaWZlIHRpbWUgb2YgdGhlIGRvbWFpbiB5b3Ugc2V0IFggdGltZXMg
dGhlIHNhbWUgcGFyYW1ldGVyCnlvdSBnZXQgYSBzdHJpbmcgb2YgZm9vPWJhcjEgZm9vPWJhcjIg
aW4gdGhlIHNhdmVkIGNvbmZpZyBmaWxlLgoKVGhlcmUgaXMgcHJvYmFibHkgYSBzaW1wbGUgc29s
dXRpb246IG1ha2UgdGhlIHBhcmFtZXRlciBsaXN0IGluIElETCBhCmtleSB2YWx1ZSBsaXN0LiBZ
b3UgdGhlbiB1cGRhdGUgdGhlIGxpc3QgYWNjb3JkaW5nbHkuCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
