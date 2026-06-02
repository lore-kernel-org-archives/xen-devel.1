Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFACC5DF71
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 08:15:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324546.1590071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKHA-0007jA-3r; Tue, 02 Jun 2026 08:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324546.1590071; Tue, 02 Jun 2026 08:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKHA-0007j3-0j; Tue, 02 Jun 2026 08:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1324546;
 Tue, 02 Jun 2026 08:15:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wUKH9-0007ix-4u
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 08:15:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUKH8-002Lxb-7G
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:15:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a1e90fe-bab6-0a2a0a5309dd-0a2a450b8868-28
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:15:02 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a1e9105-212f-0a2a450b0019-a237832fe046-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:15:02 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5F1394EE45F9;
 Tue,  2 Jun 2026 10:15:01 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1780388101;
	b=J6hJc2imUF5rqh3XosD0hi3Aj0R8/4/Cp/zPrX+nyDuQzVZafrJovw4bkF1RWz/tZvSO
	 EHTSjkDLVTLlkMjpadmLCINmUlJzLaMbuJaC8ftfVWfHxQLDjpWXesJUwIq5PmMlYv34x
	 XmuPM/5hb8JKrkPG/Ibs8yG4I+H38VdMcRyha0PJl10kv9VNmiZC8MKXPkcgwdwzIynjA
	 KYfeCiGW8Tkz15Id8UAUI6Q448KtPYFaZL2dPyLsQBpv6ZKbVQgHKV2th8CcgQ5SPl8D5
	 SmiYSBFMt7Awr1259OPT1+hTmpu6/41YBxG10akoPw2q6buYPuwqPv6U/u8NwVqF7yUq4
	 eQbg70lbjIc0YPohIzZHy0MNmWZbwiCxlzKyGIPgStSr09Kv06hCIMtiN8+/qMbeXw5jy
	 k+ZxtdInvA6o81kU3b5bSR2geRbtCRypoRM/Nmh11e2drLxtT4EyNq3flgAb5CYpwa4N1
	 iBVdcbjLI5OQUlTCtorpw0vg+3q5WzIxgqGfR2SLFcLpSuD5wp0IGD2fVfTai3d1tiseg
	 DkmUyGGHkiEFQXnkO1LAFNzNVK0D0/Y1Llx7s2YcTLwdS975FhubhWRpkzDzPskjxdHSr
	 zSzl4cxV/VDxBGLsfemp8GQoLEaj6xM6sm3okg6YNGtfHsxwHLGLcykAsUVJWjk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1780388101;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=xnz+0sh3skq6/HxqRS4I45IxfTo1knjgNl1veiTZotY=;
	b=PkzWVuKdsdOFxd81QB8GNZM0oGZXc0izsB6bXVRclLOQj8BtOq0B7mSIr3jxHnfinfnI
	 j9Hjxl88nbmRxNnxMEwfza/6lA76J4c+llvsXbnAhS6bio0TGyF8KZwRZypOSg/SjExNC
	 xN9tWVMX5gn7YZWJ/3aOx5sLyTmElxNk+KtLUENBtusBUyZwD6ovnprwNUiY3GKQTc43v
	 OFMgLZDPMW1k0vzs0QsL7cvf0YsunVq0VX4UZB5EaU+iEC0Pu4ieBhyTYZ8UOFfZ9hmzU
	 iBRlei4o74ImcKzzE3XLyRSV44QumsHWthedcRMiSM1tiL99SjqUxECPg1MmpApQKJN2h
	 5HYgYLb74y8GQtf9/Q14wNL8SyrH2r1+eWh1UsF21uZ+pMcEch+zKNQuaJWv1c4ePZWVG
	 yAJaDy5xqWL2H/XVBgX0mm7vmCGXqOztrGURLl7WusCvi+wsuxrA7tlc8YhxnEZUm942u
	 3vrkUtuqT+KzbIoKzn4pyxo6RP76sGk7T0c2LFm+1YZuyoMbk/FkjFQAijb/tCcZ/MyJx
	 RyZ4x4uG4YrMWlOQXX0bxQaooTM9o39U494Tm//R53YbL44uhLclHRB/+i+pW8gDz6w2s
	 BSgVhpw0GcUm2N+5wzqImARNIarPyVfNkb1EJJSkOZCGQXZqh4tjCbrLQlWLZ+c=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 02 Jun 2026 10:15:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Re: [PATCH v3 6/6] automation: enable Argo debugging in CI
In-Reply-To: <20260526215823.1452619-7-dmukhin@ford.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-7-dmukhin@ford.com>
Message-ID: <c13c4c101e23aab38284ddc788ea3579@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780388102-20E7CF3B-64585C49/0/0
X-purgate-type: clean
X-purgate-size: 1169

On 2026-05-26 23:58, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Enable extra Argo traces in CI to help analyze any potential Argo 
> issues.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - new patch
> - example verbose log: 
> https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14552079442
> ---
>  automation/gitlab-ci/build.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml 
> b/automation/gitlab-ci/build.yaml
> index 7f5b5938e851..5f9192e53d63 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -319,6 +319,7 @@ alpine-3.18-gcc-debug:
>        CONFIG_EXPERT=y
>        CONFIG_UNSUPPORTED=y
>        CONFIG_ARGO=y
> +      CONFIG_ARGO_DEBUG=y
>        CONFIG_UBSAN=y
>        CONFIG_UBSAN_FATAL=y
>        CONFIG_MICROCODE_SCAN_DEFAULT=y

I would add it also to the eclair-*-allcode jobs, so that code gated 
behind this is also checked.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

