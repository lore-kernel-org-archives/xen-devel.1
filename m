Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B87107BCD0
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 17:09:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1254253.1550179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w160U-0005u3-Fp; Fri, 13 Mar 2026 17:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254253.1550179; Fri, 13 Mar 2026 17:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w160U-0005tw-DD; Fri, 13 Mar 2026 17:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1254253;
 Fri, 13 Mar 2026 17:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wKdL=BN=bounce.vates.tech=bounce-md_30504962.69b444a6.v1-178a66325a344b6b960ba37226dc3e35@srs-se1.protection.inumbo.net>)
 id 1w160T-0005o9-Ed
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 17:09:01 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511cc212-1eff-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 18:08:56 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXWD64KsgzPm0Phg
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 17:08:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 178a66325a344b6b960ba37226dc3e35; Fri, 13 Mar 2026 17:08:54 +0000
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
X-Inumbo-ID: 511cc212-1eff-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773421734; x=1773691734;
	bh=e/Ez2g9MExEAxfNprdVfmmx4B+dsCdtLWpwiqA59DZk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DCK2A/sxFtR/hJjPa+9hHcd4ppfneMB2w5I6xlYJ+r4S2xhSzpp+9qq9NdWxP+ATM
	 LDSjwTyJE7To7rkDj8y6k35KzW6s40ADAwdmLrZOCWXPitTUBsNqoDF8bYS54TIm1n
	 P9pfi2GyrTp3N9Swbg4T9Fe8j7pYtcayREntIbtbQLxqDTLsuU0hG4XUDfl4vo/TvW
	 aALmkPBji3L++rZVFOgPcO+AThVxuoh8qwpwfO90zU9XzfomQLM6pX5hofg+9mSrwb
	 hwfHQNcjJerObwVGODxj1KcS6VWsLIDZcOCJ5f0fh12YZH8spkCJE6qqnDGLvCeiAk
	 DX9d4GTVCJLuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773421734; x=1773682234; i=anthony.perard@vates.tech;
	bh=e/Ez2g9MExEAxfNprdVfmmx4B+dsCdtLWpwiqA59DZk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0wK/5gdDwwY8OxIgdZ0+fFT7MEI3v+vAcrYCDvLjyxNtXF1hLdI8t1evMtDqpmiJp
	 qczbQ+MAz8GzTLkrk6A/PWOP5q/W1NXhmyDhAKzVlEMt7ZsRvSylzTUCWoGGtxTFeo
	 IptypmwsJwRLEaygdi7PnqYiS1RHKlVZsqhk7amhqv2h++ZBTTCjlIjlgTbVWmvoej
	 b2AvSWM7sdfGxaUtJ9cEdJbmPzeuNEyKgQp8G8qdW0FKy1QLT6LpG7FsEsBaVFiLK/
	 wqRzRRC0hyQvNWA4aVXfmqybgvHWOCVeb5rdO9HqTRl8/Pl7Ibkp/qz8NFaAJIbLc0
	 x1JyrXlPLMXZw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2004/11]=20tools/xenstored:=20add=20GLOBAL=5FQUOTA=5FDATA=20record=20for=20live=20update?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773421733897
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abREpWtSt0eLWo4q@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-5-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-5-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.178a66325a344b6b960ba37226dc3e35?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 17:08:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 05, 2026 at 02:52:01PM +0100, Juergen Gross wrote:
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index acdcaa769e..694ae58973 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -1332,6 +1332,27 @@ int do_set_feature(const void *ctx, struct connection *conn,
>  	return 0;
>  }
>  
> +static bool parse_quota_name(const char *name, unsigned int *qidx,
> +			     unsigned int *idx)
> +{
> +	unsigned int q;

What do you think of using something like:
    const char soft_prefix[] = "soft-";
    const size_t soft_prefix_len = sizeof(soft_prefix) - 1;
to explain the `5`, here and in e.g. the function build_quota_data() ?
We used this in libxl in one place:
    https://elixir.bootlin.com/xen/v4.21.0/source/tools/libs/light/libxl_qmp.c#L1288

But it's fine to leave it like that, as the '5's are close enought to
the prefix that we can guess easly enough.

> +
> +	if (strncmp(name, "soft-", 5)) {
> +		*idx = Q_IDX_HARD;
> +	} else {
> +		*idx = Q_IDX_SOFT;
> +		name += 5;
> +	}
> +	for (q = 0; q < ACC_N; q++) {
> +		if (quota_adm[q].name && !strcmp(quota_adm[q].name, name)) {
> +			*qidx = q;
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  static int close_xgt_handle(void *_handle)
>  {
>  	xengnttab_close(*(xengnttab_handle **)_handle);
> @@ -2001,6 +2022,61 @@ void read_state_connection(const void *ctx, const void *state)
>  	}
>  }
>  
> +static unsigned int get_quota_size(struct quota *quota, unsigned int *len)
> +{
> +	unsigned int q;
> +	unsigned int n = 0;
> +
> +	for (q = 0; q < ACC_N; q++) {
> +		if (!quota_adm[q].name)
> +			continue;
> +		if (quota[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {
> +			n++;
> +			*len += strlen(quota_adm[q].name) + 1;
> +		}
> +		if (quota[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
> +			n++;
> +			*len += strlen(quota_adm[q].name) + 5 + 1;

The value 5 here isn't explained. A comment would be nice.

> +		}
> +	}
> +
> +	return n;
> +}
> +
> +static void build_quota_data(struct quota *quota, uint32_t *val, char *name)

I guess we will need a leap of faith to trust that `val` is big enough,
after finding out that it's actually an output of multiple values, and
not an input of a single value.

And `name` seems to also be an output, and this is actually impossible
to guess from the prototype.

> +{
> +	unsigned int q;
> +	unsigned int n = 0;
> +
> +	for (q = 0; q < ACC_N; q++) {
> +		if (!quota_adm[q].name)
> +			continue;
> +		if (quota[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {
> +			val[n++] = quota[q].val[Q_IDX_HARD];
> +			strcpy(name, quota_adm[q].name);
> +			name += strlen(name) + 1;
> +		}
> +		if (quota[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
> +			val[n++] = quota[q].val[Q_IDX_SOFT];
> +			strcpy(name, "soft-");
> +			strcpy(name + 5, quota_adm[q].name);
> +			name += strlen(name) + 1;
> +		}
> +	}
> +}
> +
> +static void parse_quota_data(const uint32_t *val, const char *name,
> +			     unsigned int n, struct quota *quota)
> +{
> +	unsigned int i, q, idx;
> +
> +	for (i = 0; i < n; i++) {
> +		if (!parse_quota_name(name, &q, &idx))
> +			quota[q].val[idx] = val[i];
> +		name += strlen(name) + 1;

So for `val`, we have a size. But, we don't have a size for `name`, are
we sure that it's safe to keep reading past `NUL` characters ? Is the
size of name available somewhere?

> +	}
> +}
> +
>  static int dump_state_domain(const void *k, void *v, void *arg)
>  {
>  	struct domain *domain = v;
> @@ -2049,6 +2125,53 @@ void read_state_domain(const void *ctx, const void *state, unsigned int version)
>  		domain->features = sd->features;
>  }
>  
> +const char *dump_state_glb_quota(FILE *fp)
> +{
> +	struct xs_state_record_header *head;
> +	struct xs_state_glb_quota *glb;
> +	void *record;
> +	unsigned int n_quota;
> +	unsigned int len = sizeof(*glb);
> +	size_t ret;
> +
> +	n_quota = get_quota_size(quotas, &len);

So, get_quota_size is actually an "add" the size to this variable, and
not "store" the size in this variable. That's not confusing at all.

> +	len += n_quota * sizeof(glb->quota_val[0]);
> +	len = ROUNDUP(len, 3);
> +
> +	record = talloc_size(NULL, len + sizeof(*head));
> +	if (!record)
> +		return "Dump global quota allocation error";
> +
> +	head = record;
> +	head->type = XS_STATE_TYPE_GLB_QUOTA;
> +	head->length = len;
> +
> +	glb = (struct xs_state_glb_quota *)(head + 1);
> +	glb->n_dom_quota = n_quota;
> +	glb->n_glob_quota = 0;

Shouldn't `n_quota` be assigned to `n_glob_quota` instead? We don't have
per-domain quota yet, and only have global quota, right?

> +
> +	build_quota_data(quotas, glb->quota_val,
> +			 (char *)(glb->quota_val + n_quota));
> +
> +	ret = fwrite(record, len + sizeof(*head), 1, fp);
> +
> +	talloc_free(record);
> +
> +	if (ret != 1 || dump_state_align(fp))
> +		return "Dump global quota error";
> +
> +	return NULL;
> +}
> +
> +void read_state_glb_quota(const void *ctx, const void *state)
> +{
> +	const struct xs_state_glb_quota *glb = state;
> +	unsigned int n_quota = glb->n_dom_quota + glb->n_glob_quota;
> +	const char *name = (const char *)(glb->quota_val + n_quota);
> +
> +	parse_quota_data(glb->quota_val, name, n_quota, quotas);
> +}
> +

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


