Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF6CC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:33:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760C92081C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760C92081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdZ6-0001fB-LD; Thu, 25 Apr 2019 12:33:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdZ5-0001f6-Aa
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:33:23 +0000
X-Inumbo-ID: 4e69fcb6-6756-11e9-a5ed-7b2da8e3c551
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e69fcb6-6756-11e9-a5ed-7b2da8e3c551;
 Thu, 25 Apr 2019 12:33:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:33:18 -0600
Message-Id: <5CC1A90702000078002290A0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:33:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
In-Reply-To: <20190418123159.GD30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 committers@xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425123311.BA95vXpaY-OrwrEKJGYyMSknVkseoA6Ue6iYF1GlC-I@z>

Pj4+IE9uIDE4LjA0LjE5IGF0IDE0OjMxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
IyMgTmV3IHdvcmxkCj4gCj4gVGhlcmUgd2lsbCBiZSBhbiB1bmlmaWVkIGVuZHBvaW50IGZvciBj
b21taXR0ZXJzIGFuZCBib3RzLiBDb21taXR0ZXJzIGFuZCBib3RzCj4gd2lsbCBoYXZlIHRoZWly
IGdpdCB0cmVlcy4gUGF0Y2hlcyBhcmUgY29tbWl0dGVkIHRvIHRob3NlIHRyZWVzLiBBbiBhdXRv
bWF0ZWQKPiBzeXN0ZW0gd2lsbCBnZXQgcGF0Y2hlcyBmcm9tIHRob3NlIHRyZWVzIGFuZCB0cmln
Z2VyIENJIHJ1bnMuCj4gCj4gVGhlIHN5c3RlbSB3aWxsIHBpY2sgdXAgY29tbWl0cyBmcm9tIG9u
ZSBvZiB0aGUgdHJlZXMsIG1lcmdlIHRoZW0gd2l0aCBtYXN0ZXIKPiBhbmQgc2VuZCB0aGUgbWVy
Z2UgdG8gQ0kgc3lzdGVtcy4KPiAKPiBGb3IgYm90cywgb25seSBHaXRsYWIgQ0kgYnVpbGQgdGVz
dHMgd2lsbCBydW4uIFJlc3VsdHMgYXJlIHNlbnQgYmFjayB0bwo+IHhlbi1kZXZlbC4KClRoaXMg
YW5kIC4uLgoKPiBGb3IgY29tbWl0dGVycycgdHJlZXMsIGF0IGZpcnN0IEdpdGxhYiBDSSBidWls
ZCB0ZXN0cyBhcmUgcnVuLCBpZiB0aGUgcmVzdWx0IGlzCj4gc3VjY2Vzc2Z1bCwgdGhlIG1lcmdl
IGNvbW1pdCBpcyBzdWJtaXR0ZWQgdG8gb3NzdGVzdC4gSWYgb3NzdGVzdCBkZWVtcyB0aGUKPiBt
ZXJnZSBpcyBnb29kLCB0aGUgbWVyZ2UgaXMgcHVzaGVkIChwdWJsaXNoZWQpIHRvIHhlbi5naXQs
IG90aGVyd2lzZSB0aGUgbWVyZ2UKPiBpcyBkaXNjYXJkZWQuIFRlc3QgcmVzdWx0cyBhcmUgc2Vu
dCBiYWNrIHRvIHhlbi1kZXZlbC4KCi4uLiB0aGlzIHNvdW5kcyBsaWtlIGEgbG90IG9mIGV4dHJh
IG1haWwgdHJhZmZpYy4gQWxyZWFkeSBmb3IgdGhlIG9zc3Rlc3QKcmVwb3J0cyBJIHdvbmRlciBo
b3cgbWFueSBwZW9wbGUgYWN0dWFsbHkgbG9vayBhdCB0aGVtIChhdCBhCm1pbmltdW0gbGV2ZWwg
b2YgZGV0YWlsKS4gVGhlIG1vcmUgcmVsYXRpdmVseSBzaW1pbGFyIG1haWxzLCB0aGUgbW9yZQps
aWtlbHkgaXQgaXMgaW4gbXkgb3BpbmlvbiB0aGF0IHNvbWUgcmVsZXZhbnQgb25lIG1heSBub3Qg
YmUgcGFpZAphdHRlbnRpb24gdG8uCgo+IFdpdGggdGhpcyBzeXN0ZW0sIGFsbCBwdWJsaXNoZWQg
Y29tbWl0cyBzaG91bGQgaGF2ZSBhbHJlYWR5IHBhc3NlZCBHaXRsYWIgQ0kKPiBhbmQgb3NzdGVz
dCB0ZXN0cy4KCldoaWxlIHRoaXMgaXMgY2VydGFpbmx5IGRlc2lyYWJsZSBhcyBhIGdvYWwsIGlz
IHRoZSBwcm9ibGVtIG9mCm9jY2FzaW9uYWwgYnVpbGQgaXNzdWVzIHJlYWxseSB0aGlzIGJpZywg
d2FycmFudGluZyBpbnRyb2R1Y3Rpb24Kb2YgZnVydGhlciBvdmVyaGVhZD8KCj4gIyMgQ29uY2Vy
bnMKPiAKPiBGb3IgaW5kaXZpZHVhbCBjb21taXR0ZXJzLCB0dXJuYXJvdW5kIHRpbWUgbWF5IGJl
Y29tZSBsb25nZXIgc2luY2UgeW91IG5lZWQgdG8KPiB3YWl0IGZvciBvdGhlciB0cmVlcyB0byBi
ZSBwcm9jZXNzZWQuCgpUb2dldGhlciB3aXRoIHRoaXMgbGFyZ2VyIGxhdGVuY3ksIGNoYW5jZXMg
aW5jcmVhc2UgdGhhdCB0d28KY29tbWl0dGVycyBwaWNrIHVwIHRoZSBzYW1lIHBhdGNoIG9yIHNl
cmllcy4gV2l0aCB0b2RheSdzCnNpbmdsZSBjZW50cmFsIGluc3RhbmNlIGV2ZXJ5b25lIHB1c2hl
cyB0byBpdCBpcyBhdCBsZWFzdApwb3NzaWJsZSB0byBjaGVjayB3aGV0aGVyIHNvbWV0aGluZyBo
YXMgZ29uZSBpbiBhbHJlYWR5CmJlZm9yZSBzdGFydGluZyB0byBjb21taXQgdGhpbmdzLiBJaXJj
IHdoZW5ldmVyIEkgZW5kZWQgdXAKdHJ5aW5nIHRvIGNvbW1pdCBhIHBhdGNoIHRoYXQgd2FzIGFs
cmVhZHkgdGhlcmUsIGl0IHdhcwpiZWNhdXNlIG9mIG1lIG5vdCBoYXZpbmcgY2hlY2tlZCAoYWdh
aW4pLCByYXRoZXIgdGhhbgpiZWNhdXNlIG9mIGFuIGFjdHVhbCByYWNlLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
