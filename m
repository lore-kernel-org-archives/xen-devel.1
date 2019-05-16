From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Thu, 16 May 2019 17:25:15 +0300
Message-ID: <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
 <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Wg=TQ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hRHJw-00052d-6m
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:25:20 +0000
Received: by mail-lj1-x241.google.com with SMTP id a10so3285176ljf.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 07:25:18 -0700 (PDT)
In-Reply-To: <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMTYuMDUuMTkgMTY6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgbG9jayBjYW4gYmUgY29tcGxldGVseSByZW1vdmVkIGFueXdheS4gU2VlIG15IHByZXZpb3Vz
IGNvbW1lbnRzLgoKWW91IHN1Z2dlc3RlZCBraW5kYSBzaW1wbGlmaWVkIHRyeV9sb2NrIHdpdGgg
cnVuc3RhdGUgdXBkYXRlIHNraXBwaW5nIGluIGNhc2Ugb2YgZmFpbC4KVGhlIHF1ZXN0aW9uIGhl
cmUgaXMgaWYgd2UgYXJlIE9LIHdpdGggbm90IHVwZGF0aW5nIHJ1bnN0YXRlIHVuZGVyIGNpcmN1
bXN0YW5jZXM/ClRob3VnaCBldmVuIGluIHRoaXMgY2FzZSB0aGUgcXVlc3Rpb24gaGVyZSBtaWdo
dCBiZSBpZiB3ZSBuZWVkIGBydW5zdGF0ZV9pbl91c2VgIHBlciBWQ1BVIG9yIHBlciBEb21haW4/
IE15IGFuc3dlciBpcyBwZXIgVkNQVS4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
