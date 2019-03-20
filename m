From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2] libxc: fix HVM core dump
Date: Wed, 20 Mar 2019 16:40:59 +0000
Message-ID: <23698.27931.528014.517502@mariner.uk.xensource.com>
References: <20190320154338.24124-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wjkm=RX=citrix.com=prvs=975c0df78=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h6eH6-00080P-Db
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 16:41:08 +0000
In-Reply-To: <20190320154338.24124-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggdjJdIGxpYnhjOiBmaXggSFZNIGNvcmUgZHVtcCIpOgo+
IGY5NjliYzlmYzk2IGZvcmJpZCBnZXRfYWRkcmVzc19zaXplIGNhbGwgb24gSFZNIGd1ZXN0cywg
YmVjYXVzZSB0aGF0Cj4gZGlkbid0IG1ha2Ugc2Vuc2UuIEl0IGJyb2tlIGNvcmUgZHVtcCBmdW5j
dGlvbmFsaXR5IG9uIEhWTSBiZWNhdXNlCj4gbGlieGMgdW5jb25kaXRpb25hbGx5IGFza2VkIGZv
ciBndWVzdCB3aWR0aC4KPiAKPiBGb3JjZSBndWVzdF93aWR0aCB0byBhIHNlbnNpYmxlIHZhbHVl
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKTEdU
TS4gIFRoYW5rcyBmb3IgdGhlIGNvcGlvdXMgY29tbWVudC4KCkFja2VkLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
