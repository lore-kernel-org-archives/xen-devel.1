From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v5 12/14] x86/HVM: use x86emul_write_xcr()
Date: Thu, 15 Mar 2018 12:05:34 -0400
Message-ID: <a52d27f6-1427-d972-a9cf-a5532436242d@oracle.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7F3102000078001B22CA@prv-mh.provo.novell.com>
 <799137cc-4fca-9744-546b-40414cd12862@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=45wj=gf=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ewVMa-00008N-HU
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:04:20 +0000
In-Reply-To: <799137cc-4fca-9744-546b-40414cd12862@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTUvMjAxOCAxMTo0MyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wMy8x
OCAxMzoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC4uLiAgaW5zdGVhZCBvZiBkaXJlY3RseSBj
YWxsaW5nIGhhbmRsZV94c2V0YnYoKSwgdG8gbWFrZSB1c2Ugb2YgdGhlCj4+IGFkZGl0aW9uYWwg
Y2hlY2tpbmcgdGhlcmUuCj4+Cj4+IEFsc28gZG9uJ3QgY2FsbCBodm1fbW9uaXRvcl9jclgoWENS
MCwgLi4uKSBmb3IgaW5kZXhlcyBvdGhlciB0aGFuIHplcm8KPj4gYW55bW9yZS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
