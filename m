Return-Path: <SRS0=Qyg3=43=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BF3C18E5A
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 16:38:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DCD21D56
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 16:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7DCD21D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhtG-00019G-JG; Tue, 10 Mar 2020 16:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBhtF-00019B-Ny
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:37:57 +0000
X-Inumbo-ID: 7f209674-62ed-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f209674-62ed-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 16:37:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19645AD6C;
 Tue, 10 Mar 2020 16:37:56 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-3-jgross@suse.com>
 <758b6a3a-a08e-4b83-9523-0fcb02f705a7@suse.com>
 <7f1d759e-2a35-f7ab-7d71-104420192fb6@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c44f82ae-e5b4-d58f-5deb-2f5c6d6175bd@suse.com>
Date: Tue, 10 Mar 2020 17:37:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7f1d759e-2a35-f7ab-7d71-104420192fb6@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxNzozNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMC4wMy4yMCAx
NzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEwLjAzLjIwMjAgMDg6MjgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArdm9pZCByY3VfYmFycmllcih2b2lkKQo+Pj4gICB7Cj4+PiAtICAg
IGF0b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApOwo+Pj4gLSAgICByZXR1cm4gc3Rv
cF9tYWNoaW5lX3J1bihyY3VfYmFycmllcl9hY3Rpb24sICZjcHVfY291bnQsIE5SX0NQVVMpOwo+
Pj4gKyAgICB1bnNpZ25lZCBpbnQgbl9jcHVzOwo+Pj4gKwo+Pj4gKyAgICB3aGlsZSAoICFnZXRf
Y3B1X21hcHMoKSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0
aXJxcygpOwo+Pj4gKyAgICAgICAgaWYgKCAhYXRvbWljX3JlYWQoJmNwdV9jb3VudCkgKQo+Pj4g
KyAgICAgICAgICAgIHJldHVybjsKPj4+ICsKPj4+ICsgICAgICAgIGNwdV9yZWxheCgpOwo+Pj4g
KyAgICB9Cj4+PiArCj4+PiArICAgIG5fY3B1cyA9IG51bV9vbmxpbmVfY3B1cygpOwo+Pj4gKwo+
Pj4gKyAgICBpZiAoIGF0b21pY19jbXB4Y2hnKCZjcHVfY291bnQsIDAsIG5fY3B1cykgPT0gMCAp
Cj4+PiArICAgIHsKPj4+ICsgICAgICAgIGF0b21pY19hZGQobl9jcHVzLCAmZG9uZV9jb3VudCk7
Cj4+PiArICAgICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoJmNwdV9vbmxpbmVfbWFwLCBSQ1Vf
U09GVElSUSk7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgd2hpbGUgKCBhdG9taWNfcmVhZCgm
ZG9uZV9jb3VudCkgKQo+Pgo+PiBEb24ndCB5b3UgbGVhdmUgYSB3aW5kb3cgZm9yIHJhY2VzIGhl
cmUsIGluIHRoYXQgZG9uZV9jb3VudAo+PiBnZXRzIHNldCB0byBub24temVybyBvbmx5IGFmdGVy
IHNldHRpbmcgY3B1X2NvdW50PyBBIENQVQo+PiBsb3NpbmcgdGhlIGNtcHhjaGcgYXR0ZW1wdCBh
Ym92ZSBtYXkgb2JzZXJ2ZSBkb25lX2NvdW50Cj4+IHN0aWxsIGJlaW5nIHplcm8sIGFuZCBoZW5j
ZSBleGl0IHdpdGhvdXQgd2FpdGluZyBmb3IgdGhlCj4+IGNvdW50IHRvIGFjdHVhbGx5IF9kcm9w
XyB0byB6ZXJvLgo+IAo+IFRoaXMgY2FuIG9ubHkgYmUgYSBjcHUgbm90IGhhdmluZyBqb2luZWQg
dGhlIGJhcnJpZXIgaGFuZGxpbmcsIHNvIGl0Cj4gd2lsbCBkbyB0aGF0IGxhdGVyLgoKSSdtIGFm
cmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgLSBpZiB0d28gQ1BVcyBpbmRlcGVuZGVudGx5IGNhbGwK
cmN1X2JhcnJpZXIoKSwgbmVpdGhlciBzaG91bGQgZmFsbCB0aHJvdWdoIGhlcmUgd2l0aG91dCB3
YWl0aW5nCmF0IGFsbCwgSSB3b3VsZCB0aGluaz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
