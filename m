From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 01/23] x86: change name of parameter for
 various invlpg functions
Date: Mon, 3 Sep 2018 14:46:44 +0100
Message-ID: <20180903134644.s6ddvd57eluw72pi@zion.uk.xensource.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <ae822cd4b618fc4078e137cf69f6827f1647752c.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=42l1=lr=citrix.com=prvs=7777b264b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fwpBv-00028X-3C
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 13:46:55 +0000
Content-Disposition: inline
In-Reply-To: <ae822cd4b618fc4078e137cf69f6827f1647752c.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBBdWcgMjYsIDIwMTggYXQgMDE6MTk6MzRQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGV5IGFsbCBpbmNvcnJlY3RseSBuYW1lZCBhIHBhcmFtZXRlciB2aXJ0dWFsIGFkZHJlc3Mg
d2hpbGUgaXQgc2hvdWxkCj4gaGF2ZSBiZWVuIGxpbmVhciBhZGRyZXNzLgo+IAo+IFJlcXVlc3Rl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKSXMgdGhlcmUgbW9yZSBjb21t
ZW50IG9uIHRoaXM/CgpUaGVzZSBiZWluZyByYXRoZXIgbWVjaGFuaWNhbCBjaGFuZ2VzIG1ha2Vz
IG1lIHdvbmRlciBpZiBJIHNob3VsZCB3YWl0CnRvIGNvbGxlY3QgYWxsIG5lY2Vzc2FyeSBhY2sv
cmV2aWV3IG9yIGp1c3QgZ28gYWhlYWQgd2l0aCBKYW4gYW5kCktldmluJ3MuCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
