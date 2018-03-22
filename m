From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 4/8] x86/XPTI: use %r12 to write zero
 into xen_cr3
Date: Thu, 22 Mar 2018 10:07:03 +0000
Message-ID: <20180322100702.noj6jxir7wjvxrwk@citrix.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCBA602000078001B3710@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f68c=gm=citrix.com=prvs=6120e2e14=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyx7k-0003OK-47
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:07:08 +0000
Content-Disposition: inline
In-Reply-To: <5AAFCBA602000078001B3710@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6Mzk6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTm93IHRoYXQgd2UgemVybyBhbGwgcmVnaXN0ZXJzIGVhcmx5IG9uIGFsbCBlbnRyeSBw
YXRocywgdXNlIHRoYXQgdG8KPiBhdm9pZCBhIGNvdXBsZSBvZiBpbW1lZGlhdGVzIGhlcmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IEFja2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
