From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/1] tools/ocaml: cleanup to reduce compiler
 warnings
Date: Wed, 14 Nov 2018 11:36:11 +0000
Message-ID: <20181114113611.r7s7mofncp53mvfb@zion.uk.xensource.com>
References: <20181114110650.7179-1-christian.lindig@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=effe=nz=citrix.com=prvs=849cc1f13=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gMtT2-0003Sn-UB
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 11:36:20 +0000
Content-Disposition: inline
In-Reply-To: <20181114110650.7179-1-christian.lindig@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMTE6MDY6NDlBTSArMDAwMCwgQ2hyaXN0aWFuIExpbmRp
ZyB3cm90ZToKPiBUaGlzIGNvbW1pdCBjbGVhbnMgdXAgY29kZSB0byByZWR1Y2UgY29tcGlsZXIg
d2FybmluZ3M6Cj4gCj4gKiByZW1vdmUgdW51c2VkIG9wZW4gc3RhdGVtZW50cyAod2FybmluZyAz
MykKPiAqIHJlbW92ZSB1bnVzZWQgJ3JlYycgZGVjbGFyYXRpb25zICh3YXJuaWduIDM5KQo+ICog
cmVtb3ZlIHVudXNlZCB0eXBlIGRlY2xhcmF0aW9ucyAod2FybmluZyAzNCkKPiAqIG1hcmsgdW51
c2VkIHZhcmlhYmxlcyB3aXRoIGFuIHVuZGVyc2NvcmUgKHdhcm5pbmcgMjcpCj4gKiBtYXJrIHVu
dXNlZCB2YWx1ZSBkZWNsYXJhdGlvbnMgd2l0aCBhbiB1bmRlcnNjb3JlICh3YXJuaW5nIDMyKQo+
IAo+IFRoaXMgY29tbWl0IGRvZXMgbm90IGluY2x1ZGUgY2hhbmdlcyB0byBmaXggY29tcGlsZXIg
d2FybmluZ3MgNTIKPiAobWF0Y2hpbmcgYWdhaW5zdCBzdHJpbmdzIGluIGV4Y2VwdGlvbnMpLiBU
aGVzZSBjaGFuZ2VzIGhhdmUgbm8gaW1wYWN0Cj4gb24gZnVuY3Rpb25hbGl0eS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+
CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClZlcnkgbmljZSEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
