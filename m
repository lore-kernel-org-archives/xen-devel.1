Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A1C282CE
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:47:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7752133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7752133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEYAf-0002SV-Kz; Thu, 11 Apr 2019 11:47:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEYAe-0002SQ-GD
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 11:47:08 +0000
X-Inumbo-ID: 8861056a-5c4f-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8861056a-5c4f-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 11:47:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8EA71F560;
 Thu, 11 Apr 2019 11:47:06 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
 [10.10.120.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1764B1001E67;
 Thu, 11 Apr 2019 11:47:04 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-11-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <10573b3b-dfb8-c9e3-fb0c-6ea6f07586de@redhat.com>
Date: Thu, 11 Apr 2019 13:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-11-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 11 Apr 2019 11:47:06 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 10/31]
 OvmfPkg/XenPlatformPei: Detect OVMF_INFO from hvmloader
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411114701.Uo3xl5EFAjxsfn1vT_frFSuAPT7QichuhutXqFMZSSA@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgc3RydWN0IGlz
IG9ubHkgdXNlZnVsIHRvIHJldHJpZXZlIHRoZSBFODIwIHRhYmxlLiBUaGUKCigxKSBwbGVhc2Ug
cmVwbGFjZSAidGhpcyBzdHJ1Y3QiIHdpdGggdGhlIG5hbWUgb2YgdGhlIHN0cnVjdC4KCj4gbVhl
bkh2bWxvYWRlckluZm8gaXNuJ3QgdXNlZCB5ZXQsIGJ1dCB3aWxsIGJlIHVzZSBpbiBhIGZ1cnRo
ZXIgcGF0Y2ggdG8KPiByZXRyaWV2ZSB0aGUgRTgyMCB0YWJsZS4KPiAKPiBBbHNvIHJlbW92ZSB0
aGUgdW51c2VkIHBvaW50ZXIgZnJvbSB0aGUgWGVuSW5mbyBIT0IgYXMgdGhhdCBpbmZvcm1hdGlv
bgo+IGlzIG9ubHkgdXNlZnVsIGluIHRoZSBYZW5QbGF0Zm9ybVBlaS4KPiAKPiBDb250cmlidXRl
ZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xCj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4g
IE92bWZQa2cvSW5jbHVkZS9HdWlkL1hlbkluZm8uaCB8ICA0IC0tLS0KPiAgT3ZtZlBrZy9QbGF0
Zm9ybVBlaS9YZW4uYyAgICAgIHwgIDMgLS0tCj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVu
LmMgICB8IDIzICsrKysrKysrKysrKysrKysrKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9JbmNs
dWRlL0d1aWQvWGVuSW5mby5oIGIvT3ZtZlBrZy9JbmNsdWRlL0d1aWQvWGVuSW5mby5oCj4gaW5k
ZXggZDUxMmIwYjYzZi4uNWQ0NTc5ZjI0NCAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL0luY2x1ZGUv
R3VpZC9YZW5JbmZvLmgKPiArKysgYi9Pdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZvLmgKPiBA
QCAtMjQsMTAgKzI0LDYgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+ICAgIC8vLwo+ICAgIFZPSUQgKkh5
cGVyUGFnZXM7Cj4gICAgLy8vCj4gLSAgLy8vIExvY2F0aW9uIG9mIHRoZSBodm1faW5mbyBwYWdl
Lgo+IC0gIC8vLwo+IC0gIFZPSUQgKkh2bUluZm87Cj4gLSAgLy8vCj4gICAgLy8vIEh5cGVydmlz
b3IgbWFqb3IgdmVyc2lvbi4KPiAgICAvLy8KPiAgICBVSU5UMTYgVmVyc2lvbk1ham9yOwo+IGRp
ZmYgLS1naXQgYS9Pdm1mUGtnL1BsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9QbGF0Zm9ybVBl
aS9YZW4uYwo+IGluZGV4IGFiMzhmOTdhNjcuLjc1MTgxYmUyZmQgMTAwNjQ0Cj4gLS0tIGEvT3Zt
ZlBrZy9QbGF0Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cvUGxhdGZvcm1QZWkvWGVuLmMK
PiBAQCAtMTA0LDkgKzEwNCw2IEBAIFhlbkNvbm5lY3QgKAo+ICAgIG1YZW5JbmZvLlZlcnNpb25N
YWpvciA9IChVSU5UMTYpKFhlblZlcnNpb24gPj4gMTYpOwo+ICAgIG1YZW5JbmZvLlZlcnNpb25N
aW5vciA9IChVSU5UMTYpKFhlblZlcnNpb24gJiAweEZGRkYpOwo+ICAKPiAtICAvKiBUQkQ6IExv
Y2F0ZSBodm1faW5mbyBhbmQgcmVzZXJ2ZSBpdCBhd2F5LiAqLwo+IC0gIG1YZW5JbmZvLkh2bUlu
Zm8gPSBOVUxMOwo+IC0KPiAgICBCdWlsZEd1aWREYXRhSG9iICgKPiAgICAgICZnRWZpWGVuSW5m
b0d1aWQsCj4gICAgICAmbVhlbkluZm8sCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXggN2M4MmU1
YjY5Yi4uYTg2NjY0MWI2NyAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0zOSw2ICszOSwx
MiBAQCBTVEFUSUMgVUlOVDMyIG1YZW5MZWFmID0gMDsKPiAgCj4gIEVGSV9YRU5fSU5GTyBtWGVu
SW5mbzsKPiAgCj4gKy8vCj4gKy8vIExvY2F0aW9uIG9mIHRoZSBmaXJtd2FyZSBpbmZvIHN0cnVj
dCBzZXR1cCBieSBodm1sb2FkZXIuCj4gKy8vIE9ubHkgdGhlIEU4MjAgdGFibGUgaXMgdXNlZCBi
eSBPVk1GLgo+ICsvLwo+ICtFRklfWEVOX09WTUZfSU5GTyAqbVhlbkh2bWxvYWRlckluZm87Cj4g
Kwo+ICAvKioKPiAgICBSZXR1cm5zIEU4MjAgbWFwIHByb3ZpZGVkIGJ5IFhlbgo+ICAKPiBAQCAt
ODQsNiArOTAsOCBAQCBYZW5Db25uZWN0ICgKPiAgICBVSU5UMzIgVHJhbnNmZXJSZWc7Cj4gICAg
VUlOVDMyIFRyYW5zZmVyUGFnZXM7Cj4gICAgVUlOVDMyIFhlblZlcnNpb247Cj4gKyAgRUZJX1hF
Tl9PVk1GX0lORk8gKkluZm87Cj4gKyAgQ0hBUjggU2lnW3NpemVvZiAoSW5mby0+U2lnbmF0dXJl
KSArIDFdOwo+ICAKPiAgICBBc21DcHVpZCAoWGVuTGVhZiArIDIsICZUcmFuc2ZlclBhZ2VzLCAm
VHJhbnNmZXJSZWcsIE5VTEwsIE5VTEwpOwo+ICAgIG1YZW5JbmZvLkh5cGVyUGFnZXMgPSBBbGxv
Y2F0ZVBhZ2VzIChUcmFuc2ZlclBhZ2VzKTsKPiBAQCAtMTAzLDggKzExMSwxOSBAQCBYZW5Db25u
ZWN0ICgKPiAgICBtWGVuSW5mby5WZXJzaW9uTWFqb3IgPSAoVUlOVDE2KShYZW5WZXJzaW9uID4+
IDE2KTsKPiAgICBtWGVuSW5mby5WZXJzaW9uTWlub3IgPSAoVUlOVDE2KShYZW5WZXJzaW9uICYg
MHhGRkZGKTsKPiAgCj4gLSAgLyogVEJEOiBMb2NhdGUgaHZtX2luZm8gYW5kIHJlc2VydmUgaXQg
YXdheS4gKi8KPiAtICBtWGVuSW5mby5Idm1JbmZvID0gTlVMTDsKPiArICAvLwo+ICsgIC8vIENo
ZWNrIGlmIHRoZXJlIGFyZSBpbmZvcm1hdGlvbiBsZWZ0IGJ5IGh2bWxvYWRlcgo+ICsgIC8vCj4g
Kwo+ICsgIEluZm8gPSAoRUZJX1hFTl9PVk1GX0lORk8gKikoVUlOVE4pIE9WTUZfSU5GT19QSFlT
SUNBTF9BRERSRVNTOwo+ICsgIC8vIENvcHkgdGhlIHNpZ25hdHVyZSwgYW5kIG1ha2UgaXQgbnVs
bC10ZXJtaW5hdGVkLgoKKDIpIFBsZWFzZSB1c2UgdGhlIGZvbGxvd2luZyBzdHlsZToKCiAgLy8K
ICAvLyBDb3B5IHRoZSBzaWduYXR1cmUsIGFuZCBtYWtlIGl0IG51bGwtdGVybWluYXRlZC4KICAv
LwoKPiArICBBc2NpaVN0cm5DcHlTKFNpZywgc2l6ZW9mIChTaWcpLAo+ICsgICAgICAgICAgICAg
ICAgKENIQVI4ICopICZJbmZvLT5TaWduYXR1cmUsIHNpemVvZiAoSW5mby0+U2lnbmF0dXJlKSk7
CgooMykgVGhpcyBzaG91bGQgYmUgaW5kZW50ZWQgYXM6CgogIEFzY2lpU3RybkNweVMgKAogICAg
U2lnLAogICAgc2l6ZW9mIChTaWcpLAogICAgKENIQVI4ICopICZJbmZvLT5TaWduYXR1cmUsCiAg
ICBzaXplb2YgKEluZm8tPlNpZ25hdHVyZSkKICAgICk7CgpvcjoKCiAgQXNjaWlTdHJuQ3B5UyAo
U2lnLCBzaXplb2YgKFNpZyksIChDSEFSOCAqKSAmSW5mby0+U2lnbmF0dXJlLAogICAgc2l6ZW9m
IChJbmZvLT5TaWduYXR1cmUpKTsKCihub3RlIHRoZSB3aGl0ZXNwYWNlIGJlZm9yZSB0aGUgb3Bl
bmluZyBwYXJlbiwgYWZ0ZXIgdGhlIGZ1bmN0aW9uCmRlc2lnbmF0b3IpCgoKSSdtIG5vdCBjaGVj
a2luZyB0aGUgY29ycmVjdG5lc3Mgb2YgdGhlIHBhcmFtZXRlcnMsIGZvciBub3cuCgpXaXRoICgx
KSBhbmQgKDMpIGFkZHJlc3NlZDoKCkFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRo
YXQuY29tPgoKSWYgeW91IGNhbiwgcGxlYXNlIHZlcmlmeSB0aGUgY29tbWVudCBzdHlsZSBhbmQg
dGhlIGluZGVudGF0aW9uIHN0eWxlIGluCnRoZSBvdGhlciBwYXRjaGVzIHRvby4KClRoYW5rcwpM
YXN6bG8KCj4gKyAgaWYgKEFzY2lpU3RyQ21wIChTaWcsICJYZW5IVk1PVk1GIikgPT0gMCkgewo+
ICsgICAgbVhlbkh2bWxvYWRlckluZm8gPSBJbmZvOwo+ICsgIH0gZWxzZSB7Cj4gKyAgICBtWGVu
SHZtbG9hZGVySW5mbyA9IE5VTEw7Cj4gKyAgfQo+ICAKPiAgICBCdWlsZEd1aWREYXRhSG9iICgK
PiAgICAgICZnRWZpWGVuSW5mb0d1aWQsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
