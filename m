Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB7606A329
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7LYFy6b
Received: from list by lists.xenproject.org with outflank-mailman.1468843.1678122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7xN-000818-NO; Tue, 03 Nov 2026 06:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468843.1678122; Tue, 03 Nov 2026 06:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7xN-000811-Kp; Tue, 03 Nov 2026 06:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1468843;
 Mon, 02 Nov 2026 20:53:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <aahringo@redhat.com>) id 1xNz1p-0000pv-Gs
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:53:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNz1n-000XNK-It
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 21:53:15 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <aahringo@redhat.com>)
 id 6ae8f81c-2eae-0a2a0a5409dd-0a2a4507d510-36
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 21:53:15 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <aahringo@redhat.com>)
 id 6ae8f839-b4ea-0a2a45070019-aa0a817c8f0f-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 21:53:14 +0100
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-8NB42GHBN1-vk2R99zK5rA-1; Mon, 02 Nov 2026 15:53:09 -0500
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-3ab2f8ce13dso225991fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:53:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=X7LYFy6bDlsCDbcGpVtVvYcBRa0qrovCcHcKf2gPPrbXsIZxhhYFBkhdbxuYkbIMENoYpR
	njFKbCoVq0f5/nLmllDj2VRY0iTT/x7l3NPBQBgwXJ/4ZZ4ufaeUhjhAVqo0SOu3ULmlkC
	dS885AtwgLLxTJxxf6djT/v5pcSMfkc=
X-MC-Unique: 8NB42GHBN1-vk2R99zK5rA-1
X-Mimecast-MFC-AGG-ID: 8NB42GHBN1-vk2R99zK5rA_1793652788
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652788; x=1794257588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=hFCEYo/ZZwlxQn7F0fd6S0qFmdZ/dYh3T656+cNIJORNNIVxSjunSg1Cr/nkpORMCj
         ZYlf6QUirsvlvJTbCVubeBO6ff7F0jSpNB8ncFBiQoaxWRBOoFGm6V6USt8eIx1gJ9O3
         yxHC0wCufws+RiVvZ3ByYhZSXeET3baW+OsAX27qXyHHnciM0zT1xFhiB9XHH390xZWd
         4zqc40BDRfVMlUgken5F8xK2I24t/he9L+OlfqiFs/+cnYaS8sGyEXIFSU+7/kSL/bdg
         yCEj7QEfKhTUtSpYDfZJtz2T8QyLXgYOZQf/ddX2zzpxFDorfz99fwlEmjK4dmDYTap1
         OyKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj7Y4EaMWrhVHl1XtW8GXUzR3MSlrQsYb/lhfwOg/m14VHzUuZfmj98WZ/MAUfpX2tTiHH1cuphuo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/m6m+IJvt2e7S79etzXjIAFVKJrbRTMkvY8YE4mYczAlL6LFTB
	ROrfv+/PISgMcS+NUJJDKbJ0UGCqXidJXkUNBfVjAKCkRNrXciGZ1R2/bLutD0qBnP4jB3Mx7JX
	CwsWUrNFbGUfzPYX2IjKewotFPZs1t/TjJyQ+xazZKrQvzrHSbc3IsIKGUXvFtiFa5jmFhNDiGR
	F0z/7I4fdgdry0585nT3aV3m13UJmT4lsHLQuMXCfhIsI=
X-Gm-Gg: AYBFou2ZaoO5dtQBz34aG6eXOh6T5v5M03omMH0GSUWQI+l4KFKABiR3i7BxlFudm7o
	UFezCg+YRtw+m8QzaOlpEDf02DMMJnvggmBLTIRYqnE2/r8gC1ZPR11wp2OymtwI71gDRBx271i
	DsedrIoYkfL3nQcokhIxw9ong6SGm21OggNz5URa9BqkTBGCTTSL7GjUQ7
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr20499111fa.13.1793652788252;
        Mon, 02 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3acb7aa83b1mr20499011fa.13.1793652787872; Mon, 02 Nov 2026
 12:53:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-6-irogers@google.com>
In-Reply-To: <20261027223847.652884-6-irogers@google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:52:55 -0500
X-Gm-Features: AclHuK8pGzNf4aGPekLa6NQcs521xOugw8djA3E8ZMCjZ7yn89XzG5j_wIaQNFk
Message-ID: <CAK-6q+j-MS_5St04YFU11LG_Cjf1jOuS3q33qk_iK=7TE-iuBg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dlm: Free dlm_ls in kobject release callback
To: Ian Rogers <irogers@google.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>, 
	Greg Kroah-Hartman <gregkh@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J9If4lk6C_JOw9JaxHxXO9NY7HqT0IAExlgzYiqRmUs_1793652788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1793652795-A54C3AE4-476E85FE/35/111497
X-purgate-type: clean
X-purgate-size: 1251
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, Oct 27, 2026 at 6:39=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
> .release callback and dlm freed the lockspace structure directly via
> kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=3Dy, freeing ls before the
> delayed kobject release runs causes a use-after-free, and unloading the
> module while the delayed release is pending results in an instruction
> page fault.
>
> Add a completion ls_kobj_done and dlm_ls_release() to complete it when
> the last kobject reference is dropped, waiting for it in free_lockspace()
> before kfree(ls) and in the new_lockspace() error path before module_put(=
).
> Also delete the kobject via kobject_del() before stopping dlm_recoverd
> to close the window where concurrent sysfs writes could wake the stopped
> recovery task.
>
> Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
> Signed-off-by: Ian Rogers <irogers@google.com>

A somewhat "big change" for just a debug functionality. Althrough I
agree we shout call "kobject_del()" early to avoid additional sysfs
changes during removal.

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks.

- Alex


