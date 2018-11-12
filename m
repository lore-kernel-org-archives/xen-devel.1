From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 8/8] xen: Swich parameter in
 get_page_from_gfn to use typesafe gfn
Date: Mon, 12 Nov 2018 18:58:49 +0200
Message-ID: <CAC1Wxdhz3Cz8yD0gFep4LNA15Siz17VJNOWV00hPh_au93jP_A@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-9-julien.grall@arm.com>
 <CAC1WxdgJTv6KuJFahYScDDWqHNz7iu21BV7ep5thtcwXxUCVEw@mail.gmail.com>
 <f6b0a222-573d-c49c-52d6-93b3c9e52679@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4hls=nx=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gMFYF-0003Au-KG
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 16:59:03 +0000
Received: by mail-oi1-x243.google.com with SMTP id v198-v6so7757742oif.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Nov 2018 08:59:01 -0800 (PST)
In-Reply-To: <f6b0a222-573d-c49c-52d6-93b3c9e52679@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: kevin.tian@intel.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, jun.nakajima@intel.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Tim (Xen.org)" <tim@xen.org>, julie.grall@arm.com, Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, suravee.suthikulpanit@amd.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

PiBXaGF0J3Mgd3Jvbmcgd2l0aCBpbmNsdWRpbmcgY2xlYW4tdXAgcGF0Y2ggaW4gYSBzZXJpZXMg
YWRkaW5nIGEgZmVhdHVyZT8KCkkgZG8gbm90IG1lYW4gaXQgaXMgd3JvbmcuCkp1c3QgYXNzdW1p
bmcgdGhhdCBpbnRyb2R1Y2luZyBhIG5ldyBmZWF0dXJlIGFuZCBjbGVhbmluZyB1cCBhIGNvZGUK
bWlnaHQgYmUgZGlmZmVyZW50IHByb2Nlc3NlcyB3aXRoIGEgZGlmZmVyZW50IHJldmlldyBwZXJp
b2QuCgpTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
