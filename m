From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Wed, 17 Jan 2018 16:57:02 +0000
Message-ID: <20180117165702.2hrmjzlh5lb62hzr@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
 <20180117162855.itzoanq67fn442er@citrix.com>
 <23135.32741.685675.991384@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s8/r=em=citrix.com=prvs=5488b24bb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ebr1S-00021M-FI
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 16:57:10 +0000
Content-Disposition: inline
In-Reply-To: <23135.32741.685675.991384@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMDQ6NTU6MDFQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDYvNl0gZmlybXdhcmUvc2hpbTogZml4
IGJ1aWxkIHByb2Nlc3MgdG8gdXNlIFBPU0lYIGZpbmQgb3B0aW9ucyIpOgo+ID4gT24gV2VkLCBK
YW4gMTcsIDIwMTggYXQgMDQ6MjQ6MjdQTSArMDAwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiA+
IEFuZCBmaW5hbGx5LCBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoeSBpdCBpcyBuZWNlc3Nh
cnkgdG8gc3RyaXAKPiA+ID4gJChYRU5fUk9PVCkvJChkKS8gb3V0IGF0IGFsbC4KPiA+IAo+ID4g
V2Ugd2FudCB0aGUgcGF0aCB3aXRob3V0ICQoWEVOX1JPT1QpLyQoZCkgc28gd2UgY2FuIGNvbnN0
cnVjdCB0aGUgc2FtZQo+ID4gdHJlZSB1bmRlciAkKGQpLiBJdCBpcyBiZXR0ZXIgdG8ganVzdCBs
b29rIGF0IHRoZSB0cmVlIHN0cnVjdHVyZSBhZnRlcgo+ID4gcnVubmluZyB0aGUgbGlua2Zhcm0g
cnVuZS4KPiAKPiBGYWlyIGVub3VnaC4gIEJ1dCBJIHRoaW5rIG15IG90aGVyIHBvaW50cyBzdGls
bCBzdGFuZC4KPiAKPiBGWUkgSSBhbSBnb2luZyB0byBzaGlwIHRoZSBwYXRjaCBhcyBpcyB0byAi
Y29tZXQiIHVzZXJzIHZpYSBhbiBYU0EtMjU0Cj4gdXBkYXRlLiAgSSdtIGp1c3QgcXVpYmJsaW5n
IGFib3V0IHRoaXMgZm9yICNzdGFnaW5nLgoKWWVhaCwgd2UgY2FuIGRlZmluaXRlbHkgY2hhbmdl
IHRoZSBydW5lIHRvIHNvbWV0aGluZyBiZXR0ZXIgb25jZSB3ZSBoYXZlCmFsbCB0aGUgY3JpdGlj
YWwgaXNzdWVzIHNvbHZlZC4gVGhlIHJ1bmUgd2FzIHRoZSBiZXN0IEkgY291bGQgY29tZSB1cAp3
aXRoIHVuZGVyIGEgc2hvcnQgbm90aWNlLiBBbmQgaXQgd2Fzbid0IGNyaXRpY2FsIHNvIEkgbW92
ZWQgb24gdG8Kc29tZXRoaW5nIGVsc2UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
