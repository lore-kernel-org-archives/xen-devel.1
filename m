From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 05/11] libxl: Do root checks once in
 libxl__domain_get_device_model_uid
Date: Fri, 21 Dec 2018 17:48:14 +0000
Message-ID: <23581.10078.371224.708549@mariner.uk.xensource.com>
References: <20181221165728.6692-1-george.dunlap@citrix.com>
 <20181221165728.6692-5-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaOuT-0008KK-6p
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:48:29 +0000
In-Reply-To: <20181221165728.6692-5-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggdjMgMDUvMTFdIGxpYnhsOiBEbyByb290IGNo
ZWNrcyBvbmNlIGluIGxpYnhsX19kb21haW5fZ2V0X2RldmljZV9tb2RlbF91aWQiKToKPiBBdCB0
aGUgbW9tZW50LCB3ZSBjaGVjayBmb3IgZXF1aXZhbGVuY2UgdG8gbGl0ZXJhbCAicm9vdCIgYmVm
b3JlCj4gZGVjaWRpbmcgd2hldGhlciB0byBhZGQgdGhlIGBydW5hc2AgY29tbWFuZC1saW5lIG9w
dGlvbiB0byBRRU1VLiAgVGhpcwo+IGlzIHVuc2F0aXNmYWN0b3J5IGZvciBzZXZlcmFsIHJlYXNv
bnMuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
