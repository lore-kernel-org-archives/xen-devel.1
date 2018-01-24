From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/acpi: process softirqs while printing
	CPU ACPI data
Date: Wed, 24 Jan 2018 10:48:37 +0000
Message-ID: <9e2bf0a9-913d-c94b-5961-a7e148c50f0c@citrix.com>
References: <20180124101440.80750-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jv/h=et=citrix.com=prvs=555f7260a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eeIbm-0003s4-JM
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 10:48:46 +0000
In-Reply-To: <20180124101440.80750-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMTggMTA6MTQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBPciBlbHNlIHRoZSB3
YXRjaGRvZyB0cmlnZ2VycyBvbiBib3hlcyB3aXRoIGEgaHVnZSBudW1iZXIgb2YgQ1BVcwo+Cj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
UmVwb3J0ZWQtYnk6IFNpbW9uIENyb3dlIDxzaW1vbi5jcm93ZUBjaXRyaXguY29tPgoKQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
